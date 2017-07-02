using System.Linq;

using RMSDataAccessLayer;

using System.Windows;
using System.Windows.Controls;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Windows.Data;
using System.Printing;
using System.Threading.Tasks;
using System.Transactions;
using SUT.PrintEngine.Utils;
using System.Windows.Media;
using log4netWrapper;

using SalesRegion.Messages;
using SimpleMvvmToolkit;
using TrackableEntities;
using TrackableEntities.Common;
using TrackableEntities.EF6;

namespace SalesRegion
{
    public class SalesVM : ViewModelBase<SalesVM>
    {


        private static readonly SalesVM _instance;

        static SalesVM()
        {
            _instance = new SalesVM();
        }

        public static SalesVM Instance
        {
            get { return _instance; }
        }


        private static Cashier _cashier;

        public Cashier CashierEx
        {
            get { return _cashier; }
            set
            {
                if (_cashier != value)
                {
                    _cashier = value;
                    NotifyPropertyChanged(x => x.CashierEx);
                }
            }
        }

        public SalesVM()
        {

        }


        public void CloseTransaction()
        {
            try
            {
                Logger.Log(LoggingLevel.Info, "Close Transaction");
                if (batch == null)
                {
                    Logger.Log(LoggingLevel.Warning, "Batch is null");
                    MessageBox.Show("Batch is null");
                    return;
                }
                if (TransactionData != null)
                {
                    TransactionData.CloseBatchId = Batch.BatchId;
                    TransactionData.OpenClose = false;

                    SaveTransaction();
                    TransactionData = null;
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        //public void CreateNewPrescription()
        //{
        //    try
        //    {

        //        Logger.Log(LoggingLevel.Info, "Create New Prescription");
        //        if (doctor == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Doctor is Missing");
        //            this.Status = "Doctor is Missing";
        //            return;
        //        }

        //        if (patient == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Patient is Missing");
        //            this.Status = "Patient is Missing";
        //            return;
        //        }

        //        if (Store == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Store is Missing");
        //            this.Status = "Store is Missing";
        //            return;
        //        }

        //        if (Batch == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Batch is Missing");
        //            this.Status = "Batch is Missing";
        //            return;
        //        }

        //        if (CashierEx == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Cashier is Missing");
        //            this.Status = "CashierEx is Missing";
        //            return;
        //        }

        //        if (Station == null)
        //        {
        //            Logger.Log(LoggingLevel.Warning, "Station is Missing");
        //            this.Status = "Station is Missing";
        //            return;
        //        }
        //        Prescription txn = new Prescription()
        //        {
        //            BatchId = Batch.BatchId,
        //            StationId = Station.StationId,
        //            Time = DateTime.Now,
        //            CashierId = CashierEx.Id,
        //            PharmacistId = (CashierEx.Role == "Pharmacist" ? CashierEx.Id : null as int?),
        //            StoreCode = Store.StoreCode,
        //            OpenClose = true,
        //            DoctorId = doctor.Id,
        //            PatientId = patient.Id,
        //            Patient = patient,
        //            Doctor = doctor,
        //            Cashier = CashierEx,
        //            Pharmacist = CashierEx.Role == "Pharmacist" ? CashierEx : null,
        //            TrackingState = TrackingState.Added
        //        };
        //        txn.StartTracking();
        //        Logger.Log(LoggingLevel.Info, "Prescription Created");
        //    }
        //    catch (Exception ex)
        //    {
        //        Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
        //        throw ex;
        //    }
        //}


        //+ ToDo: Replace this with your own data fields

        private Doctor doctor = null;

        public Doctor Doctor
        {
            get { return doctor; }
            set
            {
                if (doctor != value)
                {
                    doctor = value;
                    NotifyPropertyChanged(x => x.Doctor);
                }
            }
        }

        private Patient patient = null;

        public Patient Patient
        {
            get { return patient; }
            set
            {
                if (patient != value)
                {
                    patient = value;
                    NotifyPropertyChanged(x => x.Patient);
                }
            }
        }

        private Cashier transactionCashier = null;
        public Cashier TransactionCashier
        {
            get { return transactionCashier; }
            set
            {
                if (transactionCashier != value)
                {
                    transactionCashier = value;
                    NotifyPropertyChanged(x => x.TransactionCashier);
                }
            }
        }

        private Cashier _transactionPharmacist = null;
        public Cashier TransactionPharmacist
        {
            get { return _transactionPharmacist; }
            set
            {
                if (_transactionPharmacist != value)
                {
                    _transactionPharmacist = value;
                    if (TransactionData != null)
                    {
                        if (value != null)
                        {
                            TransactionData.PharmacistId = value.Id;
                            TransactionData.Pharmacist = value;
                        }
                    }
                    NotifyPropertyChanged(x => x.TransactionPharmacist);
                }
            }
        }

        private string status = null;

        public string Status
        {
            get { return status; }
            set
            {
                if (status != value)
                {
                    status = value;
                    NotifyPropertyChanged(x => x.Status);
                }
            }
        }


        public TransactionBase transactionData;

        public TransactionBase TransactionData
        {
            get { return transactionData; }
            set
            {
                if (!object.Equals(transactionData, value))
                {
                    Set_TransactionData(value);

                }
            }
        }

        private void Set_TransactionData(TransactionBase value)
        {
            transactionData = value;
            
           SendMessage(MessageToken.TransactionDataChanged,
                new NotificationEventArgs<TransactionBase>(MessageToken.TransactionDataChanged, transactionData));
            if (transactionData != null) transactionData.PropertyChanged += TransactionData_PropertyChanged;

            NotifyPropertyChanged(x => x.TransactionData);
        }

        private void TransactionData_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "CurrentTransactionEntry")
            {
                if (transactionData != null)
                    if (transactionData.CurrentTransactionEntry != null)
                        if (transactionData.CurrentTransactionEntry.TransactionEntryItem != null)
                            SetCurrentItemDosage(transactionData.CurrentTransactionEntry.TransactionEntryItem);
            }
        }

        private ObservableCollection<object> _csv;

        public ObservableCollection<object> SearchList
        {
            get { return _csv; }

        }

        private ObservableCollection<Cashier> _pharmacists = null;

        public ObservableCollection<Cashier> Pharmacists
        {
            get
            {
                if (_pharmacists == null)
                {
                    using (var ctx = new RMSModel())
                    {
                        _pharmacists =
                            new ObservableCollection<Cashier>(
                                ctx.Persons.OfType<Cashier>().Where(x => x.Role == "Pharmacist"));
                        _pharmacists.ToList().ForEach(x => x.StartTracking());
                    }
                }
                return _pharmacists;
            }
        }


        private Cashier _currentPharmacist = null;

        public Cashier CurrentPharmacist
        {
            get
            {
                return _currentPharmacist;
            }
            set
            {
                if (_currentPharmacist != value)
                {
                    _currentPharmacist = value;
                    NotifyPropertyChanged(x => CurrentPharmacist);
                }
            }
        }


        public void UpdateSearchList(string filterText)
        {
            try
            {
                Logger.Log(LoggingLevel.Info,
                    string.Format("Update SearchList -filter Text [{0}] - StartTime:{1}", filterText, DateTime.Now));
                CompositeCollection cc = CreateSearchList(filterText);


                _csv = new ObservableCollection<Object>();
                foreach (var item in cc)
                {
                    _csv.Add(item);
                }
                NotifyPropertyChanged(x => x.SearchList);
                Logger.Log(LoggingLevel.Info,
                    string.Format("Finish Update SearchList - filter Text [{0}] - EndTime:{1}", filterText, DateTime.Now));
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public void GetSearchResults(string filterText)
        {
            UpdateSearchList(filterText);
        }



        private CompositeCollection CreateSearchList(string filterText)
        {
            try
            {
                //todo: make parallel
                Logger.Log(LoggingLevel.Info,
                    string.Format("Start Create SearchList -filter Text [{0}] - StartTime:{1}", filterText, DateTime.Now));
                CompositeCollection cc = new CompositeCollection();


                foreach (var itm in AddSearchItems())
                {
                    cc.Add(itm);
                }


                GetPatients(cc, filterText);
                GetDoctors(cc, filterText);

                AddInventory(cc, filterText);

                double t = 0;
                if (double.TryParse(filterText, out t))
                {
                    AddTransaction(cc, filterText);
                }

                Logger.Log(LoggingLevel.Info,
                    string.Format("Finish Create SearchList -filter Text [{0}] - StartTime:{1}", filterText,
                        DateTime.Now));
                return cc;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        private CompositeCollection AddSearchItems()
        {
            try
            {
                CompositeCollection cc = new CompositeCollection();
                //SearchItem b = new SearchItem();
                //b.SearchObject = new RMSDataAccessLayer.Transactionlist();
                //b.SearchCriteria = "Transaction History";
                //b.DisplayName = "Transaction History";
                //cc.Add(b);

                SearchItem p = new SearchItem();
                p.SearchObject = null;
                p.SearchCriteria = "Add Patient";
                p.DisplayName = "Add Patient";
                cc.Add(p);

                SearchItem d = new SearchItem();
                d.SearchObject = null;
                d.SearchCriteria = "Add Doctor";
                d.DisplayName = "Add Doctor";
                cc.Add(d);


                return cc;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }





        private void AddTransaction(CompositeCollection cc, string filterText)
        {
            
            if (cc == null) return;
            try
            {
                using (var ctx = new RMSModel())
                {
                    // right now any prescriptions
                    foreach (
                        var trns in
                            ctx.TransactionBase.OfType<Prescription>()
                                .Where(x => x.TransactionId.ToString().Contains(filterText))
                                .OrderBy(t => t.Time)
                                .Take(100))
                    {
                        cc.Add(trns);
                    }
                }
                using (var ctx = new RMSModel())
                {
                    foreach (
                        var trns in
                            ctx.TransactionBase.OfType<QuickPrescription>()
                                .Where(x => x.TransactionId.ToString().Contains(filterText))
                                .OrderBy(t => t.Time)
                                .Take(100))
                    {
                        cc.Add(trns);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }






        private void GetDoctors(CompositeCollection cc, string filterText)
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    foreach (
                        var cus in
                            ctx.Persons.OfType<Doctor>()
                                .Where(
                                    x =>
                                        ("Dr. " + " " + x.FirstName.Trim().Replace(".", "").Replace(" ", "").Replace("Dr", "Dr. ") + " " +
                                         x.LastName.Trim() +
                                         " " + x.Code).Contains(filterText))
                                .Take(listCount))
                    {
                        cc.Add(cus);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        private void GetPatients(CompositeCollection cc, string filterText)
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    foreach (
                        var cus in
                            ctx.Persons.OfType<Patient>()
                                .Where(x => (x.FirstName.Trim() + " " + x.LastName.Trim()).Contains(filterText))
                                .Take(listCount)) //
                    {
                        cc.Add(cus);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        private bool _showInactiveItems = false;
        public bool ShowInactiveItems
        {
            get
            {
                return _showInactiveItems;
            }
            set
            {
                _showInactiveItems = value;
                NotifyPropertyChanged(x => x.ShowInactiveItems);
            }

        }
        private int listCount = 25;


        private void AddInventory(CompositeCollection cc, string filterText)
        {
            
            try
            {
                //todo: make parallel
                using (var ctx = new RMSModel())
                {

                    var itms = ctx.Item.OfType<Medicine>().Where(x => ((x.ItemName ?? x.Description).Contains(filterText) || (x.ItemNumber.ToString().Contains(filterText)) || (x.ItemLookupCode.Contains(filterText)))
                                                                       && x.QBItemListID != null
                        // && x.Quantity > 0
                                                                       && (x.Inactive == null ||
                                                                          (x.Inactive != null && x.Inactive == _showInactiveItems)))
                                                                         
                         .Take(listCount)
                         .AsEnumerable()
                         .OrderBy(x => x.DisplayName).ToList();

                    foreach (var itm in itms)
                    {
                        cc.Add(itm);
                    }
                }

                using (var ctx = new RMSModel())
                {
                    foreach (
                        var itm in
                            ctx.Item.OfType<StockItem>()
                                .Where(x => (x.ItemName ?? x.Description).Contains(filterText))
                                .Take(listCount))
                    {
                        cc.Add(itm);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }


        }




        public void ProcessSearchListItem(object SearchItem)
        {
            try
            {
                if (SearchItem != null)
                {
                    if (TransactionData != null && TransactionData.ChangeTracker == null) TransactionData.StartTracking();
                    if (typeof(RMSDataAccessLayer.SearchItem) == SearchItem.GetType())
                    {
                        DoSearchItem(SearchItem as RMSDataAccessLayer.SearchItem);
                    }

                    if (typeof(RMSDataAccessLayer.Doctor) == SearchItem.GetType())
                    {
                        AddDoctorToTransaction(SearchItem as Doctor);
                    }

                    if (typeof(RMSDataAccessLayer.Patient) == SearchItem.GetType())
                    {
                        AddPatientToTransaction(SearchItem as Patient);
                    }

                    if (SearchItem is Item)
                    {

                        var itm = (Item)SearchItem;
                      //  if (CheckDuplicateItem(itm)) return;
                        if (itm.Quantity < 0)
                        {
                            var res = MessageBox.Show("Item may not be in stock! Do you want to continue?", "Negative Stock",
                                MessageBoxButton.YesNo);
                            if (res == MessageBoxResult.No) return;
                        }
                        SetCurrentItemDosage(itm);

                        if (TransactionData != null)
                        {
                            InsertItemTransactionEntry(itm);
                        }
                        else
                        {
                            NewItemTransaction(itm);
                        }

                    }
                    if (SearchItem is TransactionBase)
                    {
                        GoToTransaction((TransactionBase)SearchItem);
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public void SetCurrentItemDosage(TransactionEntryItem itm)
        {
            if (itm.Item == null)
            {
                using (var ctx = new RMSModel())
                {
                    itm.Item = ctx.Item.FirstOrDefault(x => x.ItemId == itm.ItemId);
                    itm.TrackingState = TrackingState.Unchanged;
                }
            }
            SetCurrentItemDosage(itm.Item);
        }

        public void SetCurrentItemDosage(Item itm)
        {
            if (itm == null) return;
            using (var ctx = new RMSModel())
            {
                itm.DosageList =
                    ctx.ItemDosages.Where(x => x.ItemId == itm.ItemId)
                        .OrderByDescending(x => x.Count)
                        .Take(5)
                        .Select(x => x.Dosage)
                        .ToList();
                itm.TrackingState = TrackingState.Unchanged;
            }
        }

        private bool CheckDuplicateItem(Item itm)
        {
            if (TransactionData != null &&
                TransactionData.TransactionEntries.FirstOrDefault(x => x.TransactionEntryItem.ItemId == itm.ItemId) != null)
            {
                MessageBox.Show("Can't add same item twice!");
                return true;
            }
            return false;
        }

        private void DoSearchItem(SearchItem searchItem)
        {
            throw new NotImplementedException();
        }


        private void AddPatientToTransaction(Patient patient)
        {
           
            if (patient == null) return;
            Patient = patient;
            if (TransactionData is Prescription == false)
            {
                var t = NewPrescription();
                CopyTransactionDetails(t, TransactionData);
               DeleteTransactionData();
                TransactionData = t;
            }
            var prescription = (Prescription)TransactionData;
            if (prescription != null)
            {
                prescription.PatientId = patient.Id;
                prescription.Patient = patient;
                prescription.Patient.StartTracking();
            }

        }



        private void AddDoctorToTransaction(Doctor doctor)
        {
            if (AutoCreateOldTransactions() == false) return;
            if (doctor == null) return;
            Doctor = doctor;
            if (TransactionData is Prescription == false)
            {
                var t = NewPrescription();
                CopyTransactionDetails(t, TransactionData);
                DeleteTransactionData();
                TransactionData = t;
            }

            var prescription = TransactionData as Prescription;
            if (prescription != null)
            {
                prescription.DoctorId = doctor.Id;
                prescription.Doctor = doctor;
                prescription.Doctor.StartTracking();
            }

        }


        private void GoToTransaction(TransactionBase trn)
        {
            GoToTransaction(trn.TransactionId);
        }


        public void GoToTransaction(int TransactionId)
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    TransactionBase ntrn;
                    ntrn = (from t in ctx.TransactionBase
                        .Include(x => x.TransactionEntries)
                        .Include(x => x.Cashier)
                       //.Include(x => x.OldPrescription)
                       // .Include("OldPrescription.TransactionEntries")
                       // .Include(x => x.Repeats)
                       // .Include("Repeats.TransactionEntries")
                        .Include("TransactionEntries.TransactionEntryItem")
                        .Include("TransactionEntries.TransactionEntryItem.Item")

                                //.Include("TransactionEntries.Item.ItemDosages")
                            where t.TransactionId == TransactionId
                            orderby t.Time descending
                            select t).FirstOrDefault();
                    if (ntrn != null)
                    {
                        IncludePrecriptionProperties(ctx, ntrn);
                        Item = null;
                        NotifyPropertyChanged(x => x.Item.DosageList);
                        TransactionData = ntrn;
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        public void GoToPreviousTransaction()
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    TransactionBase ptrn;

                    if (TransactionData == null || TransactionData.TransactionId == 0)
                    {
                        ptrn = GetDBTransaction(ctx).FirstOrDefault();
                    }
                    else
                    {
                        ptrn = GetDBTransaction(ctx).FirstOrDefault(t => t.TransactionId < TransactionData.TransactionId);
                    }
                   
                    if (ptrn != null)
                    {
                        IncludePrecriptionProperties(ctx, ptrn);
                        Item = null;
                        NotifyPropertyChanged(x => x.Item.DosageList);

                      //  IncludeInventoryProperties(ctx, ptrn);
                        TransactionData = ptrn;
                        this.Item = null;
                    }
                    else
                    {
                        MessageBox.Show("No previous transaction");
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        private IOrderedQueryable<TransactionBase> GetDBTransaction(RMSModel ctx)
        {
            try
            {
                TransactionBase ptrn;
                return (from t in ctx.TransactionBase
                    .Include(x => x.TransactionEntries)
                    .Include(x => x.Cashier)
                  //  .Include(x => x.OldPrescription)
                  //  .Include("OldPrescription.TransactionEntries")
                  // .Include(x => x.Repeats)
                  //  .Include("Repeats.TransactionEntries")
                    .Include("TransactionEntries.TransactionEntryItem")
                    .Include("TransactionEntries.TransactionEntryItem.Item")
                            //.Include("TransactionEntries.Item.ItemDosages")
                        orderby t.Time descending
                        select t);

                //return ptrn;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public void IncludePrecriptionProperties(TransactionBase ptrn)
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    IncludePrecriptionProperties(ctx,ptrn);
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public void IncludePrecriptionProperties(RMSModel ctx, TransactionBase ptrn)
        {
            try
            {
                if (ptrn is Prescription)
                {
                    var pc = (ptrn as Prescription);
                    pc.Doctor = ctx.Persons.OfType<Doctor>().FirstOrDefault(x => x.Id == pc.DoctorId);
                    pc.Doctor.StartTracking();
                    pc.Patient = ctx.Persons.OfType<Patient>().FirstOrDefault(x => x.Id == pc.PatientId);
                    pc.Patient.StartTracking();
                 
                }
                this.TransactionCashier = ctx.Persons.OfType<Cashier>().FirstOrDefault(x => x.Id == ptrn.CashierId);
               
                this.TransactionPharmacist = ctx.Persons.OfType<Cashier>().FirstOrDefault(x => x.Id == ptrn.PharmacistId);
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        private void InsertItemTransactionEntry(RMSDataAccessLayer.Item itm)
        {
            try
            {
                var medicine = itm as Medicine;
                if (TransactionData.CurrentTransactionEntry == null)
                {
                   
                        PrescriptionEntry p = new PrescriptionEntry()
                        {
                            StoreID = Store.StoreId,
                            TransactionId = TransactionData.TransactionId,
                            TransactionEntryItem = CreateTransactionEntryItem(itm),

                            Price = itm.Price,
                            Dosage = medicine == null?"":medicine.SuggestedDosage,
                            Taxable = itm.SalesTax != 0,
                            SalesTaxPercent = itm.SalesTax.GetValueOrDefault(),
                            TransactionTime = DateTime.Now,
                            EntryNumber =
                                TransactionData.TransactionEntries == null
                                    ? 0
                                    : (short?)TransactionData.TransactionEntries.Count,
                            // Transaction = TransactionData,
                            
                            TrackingState = TrackingState.Added
                        };
                        p.StartTracking();
                    
                        TransactionData.TransactionEntries.Add(p);
                        NotifyPropertyChanged(x => TransactionData.TransactionEntries);
                        this.TransactionData.CurrentTransactionEntry = p;
                    
                }
                else
                {
                    var item = this.TransactionData.CurrentTransactionEntry;
                    if (item != null)
                    {
                        SetTransactionEntryItem(itm, item);

                        item.Price = itm.Price;
                        item.Taxable = itm.SalesTax != 0;
                        item.SalesTaxPercent = itm.SalesTax.GetValueOrDefault();
                        //if (medicine != null) item.Dosage = medicine.SuggestedDosage;

                        this.TransactionData.UpdatePrices();
                    }
                    
                    
                    this.Item = itm;
                }





                NotifyPropertyChanged(x => x.TransactionData);
                //NotifyPropertyChanged(x => x.CurrentTransactionEntry);
                NotifyPropertyChanged(x => x.Item);
                return;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        private TransactionEntryItem CreateTransactionEntryItem(Item itm)
        {
            return new TransactionEntryItem()
            {
                ItemId = itm.ItemId,
                ItemName = itm.ItemName ?? itm.Description,
                ItemNumber = itm.ItemNumber,
            QBItemListID = itm.QBItemListID,
                Item = itm,
                TrackingState = TrackingState.Added
            };
        }

        private TransactionEntryItem CreateTransactionEntryItem(TransactionEntryItem itm)
        {
            var ti = new TransactionEntryItem()
            {
                ItemId = itm.ItemId,
                ItemName = itm.ItemName,
                ItemNumber = itm.ItemNumber,
                QBItemListID = itm.QBItemListID,
                Item = itm.Item,
                TrackingState = TrackingState.Added
            };
            
            return ti;
        }

        private static void SetTransactionEntryItem(Item itm, PrescriptionEntry item)
        {
            item.TransactionEntryItem.TrackingState = TrackingState.Modified;
            item.TransactionEntryItem.ItemId = itm.ItemId;
            item.TransactionEntryItem.ItemName = itm.ItemName ?? itm.Description;
            item.TransactionEntryItem.ItemNumber = itm.ItemNumber;
            item.TransactionEntryItem.QBItemListID = itm.QBItemListID;
            item.TransactionEntryItem.Item = itm;
        }


        private bool AutoCreateOldTransactions()
        {
            try
            {
                if (TransactionData == null) return false;
                if (TransactionData.Time.Date != DateTime.Now.Date)
                {
                      MessageBox.Show(
                            "Modifying old transactions is not allowed! Do you want to create a New Transaction?",
                            "Can't Modify Old Transaction", MessageBoxButton.OK);
                    return false;
                }
                return true;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        public void DeleteTransactionEntry<T>(TransactionEntryBase dtrn) where T : TransactionEntryBase
        {
            try
            {
                if (dtrn == null)
                {

                    return;
                }
                if (AutoCreateOldTransactions() == false) return;

                using (var ctx = new RMSModel())
                {
                    var d = ctx.TransactionEntryBase.FirstOrDefault(x => x.TransactionEntryId == dtrn.TransactionEntryId);
                    if (d != null)
                    {
                        d.TrackingState = TrackingState.Deleted;
                        ctx.ApplyChanges(d);
                        ctx.SaveChanges();
                        d.AcceptChanges();
                    }
                    //else
                    //{
                    //    TransactionData.TransactionEntries.Remove(dtrn);
                    //}

                    //NotifyPropertyChanged(x => TransactionData.TransactionEntries);
                    //NotifyPropertyChanged(x => TransactionData);
                    //TransactionData.UpdatePrices();

                }
                GoToTransaction(TransactionData.TransactionId);
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        public void DeleteCurrentTransaction()
        {
            try
            {


                Logger.Log(LoggingLevel.Info,
                    string.Format("Start DeleteCurrentTransaction: StartTime:{0}", DateTime.Now));
                if (
                    MessageBox.Show("Are you sure you want to delete?", "Delete Current Transaction",
                        MessageBoxButton.YesNo) ==
                    MessageBoxResult.Yes)
                {
                    if (TransactionData != null && TransactionData.Time.Date != DateTime.Now.Date)
                    {
                        MessageBox.Show("Modifying old transactions is not allowed!",
                            "Can't Modify Old Transaction");
                        return;
                    }

                    //if (TransactionData.Repeats.Any())
                    //{
                    //    MessageBox.Show("This Prescription has been repeated! ");
                    //    return;
                    //}
                    DeleteTransactionData();
                    GoToPreviousTransaction();

                }
                Logger.Log(LoggingLevel.Info,
                    string.Format("Finish DeleteCurrentTransaction: EndTime:{0}", DateTime.Now));
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        private void DeleteTransactionData()
        {
           
            if (TransactionData != null && TransactionData.TrackingState != TrackingState.Added)
            {
                using (var ctx = new RMSModel())
                {
                    var t = ctx.TransactionBase.FirstOrDefault(x => x.TransactionId == TransactionData.TransactionId);
                    if (TransactionData != null)
                    {
                        t.TrackingState = TrackingState.Deleted;
                        ctx.ApplyChanges(t);
                        ctx.SaveChanges();
                    }
                    TransactionData.TrackingState = TrackingState.Deleted;
                    // TransactionData.AcceptChanges();
                }
            }
            TransactionData = null;
        }


        public TransactionBase CopyCurrentTransaction(bool copydetails = true)
        {
            try
            {
                using (var t = new TransactionScope())
                {
                    dynamic newt = null;
                    if (TransactionData is Prescription)
                    {
                        var p = NewPrescription();
                        p.StartTracking();
                        var doc = ((Prescription) TransactionData).Doctor;
                        if (doc != null)
                        {
                            p.Doctor = doc;
                            p.DoctorId = p.Doctor.Id;
                            p.Doctor.StartTracking();
                        }
                        var pat = ((Prescription) TransactionData).Patient;
                        if (pat != null)
                        {
                            p.Patient = pat;
                            p.Patient.StartTracking();
                            p.PatientId = p.Patient.Id;
                        }
                        newt = p;
                    }
                    if (TransactionData is QuickPrescription)
                        newt = CreateNewQuickPrescription();
                        newt.StartTracking();

                    if (copydetails)
                    {
                        CopyTransactionDetails(newt, TransactionData);
                    }
                    newt.UpdatePrices();
                    t.Complete();
                    return newt;
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + " | " + ex.StackTrace);
                throw ex;
            }
        }

        private void CopyTransactionDetails(dynamic newt, TransactionBase t)
        {
            if (newt == null || t == null) return;
            foreach (var itm in t.TransactionEntries.OfType<PrescriptionEntry>())
            {
                var te = new PrescriptionEntry()
                {
                    Dosage = itm.Dosage,
                    TransactionEntryItem = CreateTransactionEntryItem(itm.TransactionEntryItem),
                    Repeat = itm.Repeat,
                    Quantity = itm.Quantity,
                    SalesTaxPercent = itm.SalesTaxPercent,
                    Price = itm.Price,
                    ExpiryDate = itm.ExpiryDate,
                    Comment = itm.Comment,
                    TrackingState = TrackingState.Added
                };
                te.StartTracking();
                
                newt.TransactionEntries.Add(te);
            }
        }


        public void AutoRepeat()
        {
            try
            {
                
                TransactionBase newt = CopyCurrentTransaction();
                foreach (PrescriptionEntry item in newt.TransactionEntries.ToList())
                {
                    if (item.Repeat == 0)
                    {
                        //newt.TransactionEntries.Remove(item);
                        // rms.Detach(item);
                    }
                    else
                    {
                        item.Repeat -= 1;
                    }

                }

                var oldTrans = TransactionData;
                // rms.TransactionBase.AddObject(newt);
                TransactionData = newt;
               // SaveTransaction();

                //if (oldTrans is Prescription)
                //{
                    
                //    ((Prescription)TransactionData).OldPrescription.Add(oldTrans as Prescription);
                   
                //}
                SaveTransaction();
                SalesVM.Instance.GoToTransaction(newt.TransactionId);
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ;
            }

        }


        private void NewItemTransaction(Item SearchItem)
        {
            try
            {
              //  if (CheckDuplicateItem(SearchItem)) return;
                if (TransactionData == null)
                {
                    TransactionData = CreateNewQuickPrescription();
                    TransactionData.StartTracking();
                }
                InsertItemTransactionEntry(SearchItem as Item);
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        private QuickPrescription CreateNewQuickPrescription()
        {
            try
            {
                return new QuickPrescription()
                {
                    BatchId = Batch.BatchId,
                    StationId = Station.StationId,
                    Time = DateTime.Now,
                    CashierId = CashierEx.Id,
                    PharmacistId = (CashierEx.Role == "Pharmacist" ? CashierEx.Id : null as int?),
                    StoreCode = Store.StoreCode,
                    OpenClose = true,
                    TrackingState = TrackingState.Added
                };
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        public void Print(ref Grid fwe)
        {
            FrameworkElement f = fwe;
            Print(ref f);
        }


        public void Print(ref FrameworkElement fwe)
        {
                            try
                {
                    if (TransactionData == null) return;
                    //  LocalPrintServer printserver = new LocalPrintServer();
                    PrintServer printserver = new PrintServer(Station.PrintServer);

                    //RotateTransform myRotateTransform = new RotateTransform();
                    //myRotateTransform.Angle = 270;
                    //fwe.RenderTransform = myRotateTransform;
                    //fwe.UpdateLayout();
                    Size visualSize;

                //visualSize = new Size(fwe.ActualWidth, fwe.ActualHeight < 270 ? 270 : fwe.ActualHeight); // paper size // 2 * 96//, fwe.ActualHeight + 5
                visualSize = new Size(fwe.ActualWidth, fwe.ActualHeight);

                DrawingVisual visual = PrintControlFactory.CreateDrawingVisual(fwe, fwe.ActualWidth, fwe.ActualHeight);//fwe.ActualWidth// , 


                    SUT.PrintEngine.Paginators.VisualPaginator page = new SUT.PrintEngine.Paginators.VisualPaginator(
                        visual, visualSize, new Thickness(0, 0, 0, 0), new Thickness(0, 0, 0, 0));
                    page.Initialize(false);



                    PrintDialog pd = new PrintDialog();
                    //pd.ShowDialog();
                    pd.PrintQueue = printserver.GetPrintQueue(Station.ReceiptPrinterName);
                    pd.PrintQueue.DefaultPrintTicket.PageOrientation = PageOrientation.Portrait;
                    //pd.PrintTicket.PageOrientation = PageOrientation.Portrait;
                    // pd.PrintTicket.PageMediaSize = new PageMediaSize(PageMediaSizeName., pd.PrintTicket.PageMediaSize.Width.GetValueOrDefault(), fwe.ActualHeight / 96);
                    pd.PrintDocument(page, "");

                }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }


        public void PostRMSSale(string res = null)
        {

            try
            {

                if (TransactionData == null || string.IsNullOrEmpty(TransactionData.TransactionNumber))
                {
                    MessageBox.Show("Invalid Transaction Please Try again");
                    return;
                }
                if (TransactionData.ChangeTracker == null) TransactionData.StartTracking();
                    TransactionData.Status = "ToBePosted";
                    SaveTransaction();
                    
                    Post(TransactionData, res ?? TransactionData.TransactionNumber);
                   

            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

       

        private void Post(TransactionBase TransactionData, string res)
        {
            try
            {
                TransPreZeroConverter tz = new TransPreZeroConverter();
                if (TransactionData == null) return;
                using (RMS.RMSEntities rmsdb = new RMS.RMSEntities())
                {

                    var b = rmsdb.Batch.Where(x => x.Status == 0).AsEnumerable().LastOrDefault();
                    if (b == null)
                    {
                        MessageBox.Show("RMS Batch not available. Please login cashier or create new batch then try again!");
                        return;
                    }
                    rmsdb.ExecuteStoreCommand(string.Format(@"INSERT INTO TransactionHold
                                                             (TransactionType, TransactionTime, BatchNumber, HoldComment, StoreID, RecallID, Comment, PriceLevel, DiscountMethod, DiscountPercent, Taxable, CustomerID, DeltaDeposit, DepositOverride, 
                                                             DepositPrevious, PaymentsPrevious, TaxPrevious, SalesRepID, ShipToID, ExpirationOrDueDate, ReturnMode, ReferenceNumber, ShippingChargePurchased, ShippingChargeOverride, ShippingServiceID, 
                                                             ShippingTrackingNumber, ShippingNotes, ReasonCodeID, ExchangeID, ChannelType, DefaultDiscountReasonCodeID, DefaultReturnReasonCodeID, DefaultTaxChangeReasonCodeID)
                                                             VALUES (1, CONVERT(DATETIME, '{0}', 102), {1}, N'{2}', 0, 0, N'', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, CONVERT(DATETIME, '2013-12-01 00:00:00', 102), 0, N'', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0)", DateTime.Now.ToShortDateString(), b.BatchNumber, res, typeof(string), null, null).ToString()); //res /*tz.Convert(TransactionData.TransactionNumber*/
                    //string tn = tz.Convert(TransactionData.TransactionNumber, typeof(string), null, null).ToString();
                    RMS.TransactionHold trn = rmsdb.TransactionHold.Where(x => x.HoldComment == res && x.TransactionTime == DateTime.Today).ToList().LastOrDefault();

                    if (trn != null)
                    {
                        foreach (var te in TransactionData.TransactionEntries)
                        {
                            rmsdb.ExecuteStoreCommand(string.Format(@"INSERT INTO TransactionHoldEntry
                         (TransactionTime, ItemID, PriceSource, FullPrice, Price, QuantityReserved, QuantityPurchased, Description, TransactionHoldID)
                        VALUES        (CONVERT(DATETIME, '{0}', 102), {1}, 1, {2}, {3}, {4}, {5}, N'{6}', {7})",
                                DateTime.Now.ToShortDateString(), te.TransactionEntryItem.QBItemListID, te.Price,
                                te.Price, te.Quantity, te.Quantity, te.TransactionEntryItem.ItemName.Replace("'", "''"),
                                trn.ID));

                        }

                        if (TransactionData is Prescription)
                        {
                            var surcharge = rmsdb.Item.FirstOrDefault(x => x.Description == "Prescription Fee");
                            if (surcharge != null)
                            {
                                rmsdb.ExecuteStoreCommand(string.Format(@"INSERT INTO TransactionHoldEntry
                         (TransactionTime, ItemID, PriceSource, FullPrice, Price, QuantityReserved, QuantityPurchased, Description, TransactionHoldID)
                        VALUES        (CONVERT(DATETIME, '{0}', 102), {1}, 1, {2}, {3}, {4}, {5}, N'{6}', {7})",
                                    DateTime.Now.ToShortDateString(), surcharge.ID, surcharge.Price,
                                    surcharge.Price, 1, 1, surcharge.Description.Replace("'", "''"),
                                    trn.ID));
                            }
                            else
                            {
                                MessageBox.Show("Please Create Item In RMS with 'Prescription Fee'!");
                            }
                        }
                        TransactionData.ReferenceNumber = trn.ID.ToString();
                        TransactionData.Status = "Posted";
                        SaveTransaction(TransactionData);
                    }
                    else
                    {
                        MessageBox.Show("RMS Transaction Not Found! try again!");
                    }
                }

            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public async Task DownloadRMSItems()
        {
            try
            {
                var itmscount = 0;
                var itmLst = new List<RMS.Item>();
                using (var rmsdb = new RMS.RMSEntities())
                {
                    itmscount = rmsdb.Item.Count();
                    itmLst = rmsdb.Item.ToList();
                }


            var itmcnt = 0;
                while (itmcnt <= itmLst.Count)
                {
                    var itms = itmLst.Skip(itmcnt).Take(100);
                    await Task.Run(() =>
                    {
                        UpdateItems(itms.ToList());
                        Status = $"{itmcnt} RMS Inventory Items  Processed of {itmscount}";
                    }).ConfigureAwait(false);
                    itmcnt += 100;
                }
               
               
                Status = "";
                MessageBox.Show("Inventory Downloaded");

            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                MessageBox.Show("Download Error Try again or Call Joseph 405-8243");
                throw ex;
            }
        }

        private void UpdateItems(List<RMS.Item> itms)
        {
           
            using (var ctx = new RMSModel())
            {
                foreach (var item in itms)
                {


                    Item qi = ctx.Item.FirstOrDefault(x => x.QBItemListID == item.ID.ToString());
                    if (qi == null)
                    {
                        qi = new Medicine();
                        // qi.StartTracking();
                        qi.Description = item.Description;
                        
                        qi.Inactive = false;
                        qi.TrackingState = TrackingState.Added;
                        ctx.ApplyChanges(qi);
                    }

                    if (qi != null)
                    {
                        // qi.StartTracking();
                        qi.QBItemListID = item.ID.ToString();
                        qi.ItemNumber = item.ID.ToString();
                        qi.ItemLookupCode = item.ItemLookupCode;
                        qi.Description = item.Description;
                        qi.Price = (double) item.Price;
                        qi.Quantity = Convert.ToDouble(item.Quantity);
                        qi.SalesTax = item.TaxID == 1 ? 0.15 : 0;
                        
                        ctx.ApplyChanges(qi);
                        //ctx.SaveChanges();
                        //qi.AcceptChanges();
                    }
                }

                ctx.SaveChanges();
               
            }
        }


        public void Notify(string token, object sender, NotificationEventArgs e)
        {
            MessageBus.Default.Notify(token, sender, e);
        }






        private Item item = null;

        public Item Item
        {
            get { return item; }
            set
            {
                if (item != null)
                {
                    item = value;
                    NotifyPropertyChanged(x => x.Item);
                }
            }
        }

        private ObservableCollection<TransactionsView> transactionList = null;

        public ObservableCollection<TransactionsView> TransactionList
        {
            get { return transactionList; }
            set
            {
                if (transactionList != value)
                {
                    transactionList = value;
                    NotifyPropertyChanged(x => x.TransactionList);
                }
            }
        }

        public Patient CreateNewPatient(string searchtxt)
        {
            var p = CreateNewPatient();
            p.StartTracking();
            SetNames(searchtxt, p);
            return p;
        }

        private void SetNames(string searchtxt, Person p)
        {
            var strs = searchtxt.Split(' ');
            p.FirstName = strs.FirstOrDefault();
            p.LastName = strs.LastOrDefault();
        }

        public Patient CreateNewPatient()
        {
            return new Patient(){TrackingState = TrackingState.Added};
        }

        public void SavePerson(Person patient)
        {
            try
            {
                using (var ctx = new RMSModel())
                {
                    //ctx.Persons.AddOrUpdate(patient);
                    //ctx.SaveChanges();
                    ctx.ApplyChanges(patient);
                    ctx.SaveChanges();
                    patient.AcceptChanges();
                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public List<TransactionBase> GetPatientTransactionList(Patient p)
        {
            using (var ctx = new RMSModel())
            {
                return
                    new List<TransactionBase>(
                        ctx.TransactionBase.OfType<Prescription>().Where(x => x.PatientId == p.Id).ToList());
            }
        }

        public List<TransactionBase> GetDoctorTransactionList(Doctor d)
        {
            using (var ctx = new RMSModel())
            {
                return
                    new List<TransactionBase>(
                        ctx.TransactionBase.OfType<Prescription>().Where(x => x.DoctorId == d.Id).ToList());
            }
        }


        public Doctor CreateNewDoctor(string searchtxt)
        {
            var d = CreateNewDoctor();
            d.StartTracking();
            SetNames(searchtxt, d);
            return d;
        }
        public Doctor CreateNewDoctor()
        {
            return new Doctor() { TrackingState = TrackingState.Added }; 
        }

        public void SaveTransaction()
        {
            SaveTransaction(TransactionData);
            NotifyPropertyChanged(x => x.TransactionData);
        }

        public void SaveTransaction(TransactionBase trans)
        {
            try
            {
                if (trans == null || trans.TransactionEntries == null) return;

                if (trans != null && trans.GetType() == typeof(Prescription))
                {
                    var p = trans as Prescription;
                    if (p.Doctor == null)
                    {
                        MessageBox.Show("Please Select a doctor");
                        return;
                    }
                    if (p.Patient == null)
                    {
                        MessageBox.Show("Please Select a Patient");
                        return;
                    }
                }
                if (trans.ChangeTracker == null) return;
              using (var ctx = new RMSModel())
              {
                 
                    try
                    {
                        var t = trans;//trans.ChangeTracker.GetChanges();
                        t.TransactionEntries.ToList().ForEach(x => x.TransactionEntryItem.Item = null);
                        
                        ctx.ApplyChanges(t);
                        ctx.SaveChanges();
                       // trans.ChangeTracker.MergeChanges(ref trans,t);
                       GoToTransaction(t.TransactionId);
                        //.TransactionNumber = trans.TransactionNumber;
                    }
                    catch (DbUpdateConcurrencyException dce)
                    {
                        // Get failed entry
                        foreach (var itm in dce.Entries)
                        {
                            if (itm.State != EntityState.Added)
                            {
                                var dv = itm.GetDatabaseValues();
                                if (dv != null) itm.OriginalValues.SetValues(dv);
                            }
                        }
                    }
                    catch (Exception ex1)
                    {
                        if (!ex1.Message.Contains("Object reference not set to an instance of an object")) throw;
                    }

                   // trans.TransactionId = trans.TransactionId;
                       
                    if (trans != null)
                    {
                        var dbEntry = ctx.Entry(trans);

                        if (dbEntry != null && dbEntry.State != EntityState.Deleted)
                        {
                            if (trans.TransactionEntries != null)
                                foreach (var itm in trans.TransactionEntries)
                                {
                                    itm.TransactionId =
                                        trans.TransactionEntries.FirstOrDefault(
                                            x => x.TransactionEntryId == itm.TransactionEntryId).TransactionId;
                                    itm.TransactionEntryNumber = itm.TransactionEntryNumber;
                                }
                        }
                    }
                }
                
            }
           
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw;
            }
        }

        private void CleanTransactionNavProperties(TransactionBase titm, RMSModel ctx)
        {
            try
            {
                var itm = titm as Prescription;
                if (itm != null)
                {
                    var dbEntityEntry = ctx.Entry(itm.Doctor);
                    if (dbEntityEntry != null &&
                        (dbEntityEntry.State != EntityState.Unchanged && dbEntityEntry.State != EntityState.Detached))
                    {
                        dbEntityEntry.State = EntityState.Unchanged;
                    }
                    var p = ctx.Entry(itm.Patient);
                    if (p != null && (p.State != EntityState.Unchanged && p.State != EntityState.Detached))
                    {
                        p.State = EntityState.Unchanged;
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }
        
        private static Batch batch;

        public Batch Batch
        {
            get { return batch; }
            set
            {
                if (batch != value)
                {
                    batch = value;
                    NotifyPropertyChanged(x => x.Batch);
                }
            }

        }

        private static Station station;

        public Station Station
        {
            get { return station; }
            set
            {
                if (station != value)
                {
                    station = value;
                    NotifyPropertyChanged(x => x.Station);
                }
            }

        }

        private static Store store;

        public Store Store
        {
            get { return store; }
            set
            {
                if (store != value)
                {
                    store = value;
                    NotifyPropertyChanged(x => x.Store);
                }
            }

        }



        internal Prescription NewPrescription()
        {
            try
            {
                var trn = new Prescription()
                {
                    StationId = Station.StationId,
                    BatchId = Batch.BatchId,
                    Time = DateTime.Now,
                    CashierId = _cashier.Id,
                    StoreCode = Store.StoreCode,
                    TrackingState = TrackingState.Added
                };
                trn.StartTracking();

                return trn;
            }
            catch (Exception ex)
            {
                Logger.Log(LoggingLevel.Error, ex.Message + ex.StackTrace);
                throw ex;
            }
        }

        public bool ServerMode { get; set; }

        internal void SaveMedicine(Medicine medicine)
        {
            using (var ctx = new RMSModel())
            {
                ctx.ApplyChanges(medicine);
                ctx.SaveChanges();
                medicine.AcceptChanges();
            }
       
        }
    }
}
