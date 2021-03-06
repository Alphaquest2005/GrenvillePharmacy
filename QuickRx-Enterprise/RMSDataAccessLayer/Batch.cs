//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RMSDataAccessLayer
{
    using System.ComponentModel;
    using TrackableEntities;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Runtime.Serialization;
    using System.Collections.ObjectModel;

    using System;
    using System.Collections.Generic;
    using TrackableEntities.Client;
    
    public partial class Batch : EntityBase
    {
        public Batch()
        {
            this.TransactionBase = new ObservableCollection<TransactionBase>();
            this.CloseTransactionBase = new ObservableCollection<TransactionBase>();
            CustomStartup();
            this.PropertyChanged += UpdatePropertyChanged;
            
        }
        partial void CustomStartup();
    
            private void UpdatePropertyChanged(object sender, PropertyChangedEventArgs e)
            {
                if (!string.IsNullOrEmpty(e.PropertyName) && (!Environment.StackTrace.Contains("Internal.Materialization")) && TrackingState == TrackingState.Unchanged)
                {
                    TrackingState = TrackingState.Modified;
                }
            }
    
            ChangeTrackingCollection<Batch> _changeTracker;
    
            [NotMapped]
            [IgnoreDataMember]
            public ChangeTrackingCollection<Batch> ChangeTracker
            {
                get
                {
                    return _changeTracker;
                }
            }
            
            public new void StartTracking()
            {
                _changeTracker = new ChangeTrackingCollection<Batch>(this);
            }
        [DataMember]
    	public int BatchId
    	{ 
    		get { return _BatchId; }
    		set
    		{
    			if (Equals(value, _BatchId)) return;
    			_BatchId = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private int _BatchId;
        [DataMember]
    	public double OpeningCash
    	{ 
    		get { return _OpeningCash; }
    		set
    		{
    			if (Equals(value, _OpeningCash)) return;
    			_OpeningCash = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private double _OpeningCash;
        [DataMember]
    	public Nullable<double> EndingCash
    	{ 
    		get { return _EndingCash; }
    		set
    		{
    			if (Equals(value, _EndingCash)) return;
    			_EndingCash = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<double> _EndingCash;
        [DataMember]
    	public System.DateTime OpeningTime
    	{ 
    		get { return _OpeningTime; }
    		set
    		{
    			if (Equals(value, _OpeningTime)) return;
    			_OpeningTime = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private System.DateTime _OpeningTime;
        [DataMember]
    	public Nullable<System.DateTime> ClosingTime
    	{ 
    		get { return _ClosingTime; }
    		set
    		{
    			if (Equals(value, _ClosingTime)) return;
    			_ClosingTime = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<System.DateTime> _ClosingTime;
        [DataMember]
    	public Nullable<double> TotalTender
    	{ 
    		get { return _TotalTender; }
    		set
    		{
    			if (Equals(value, _TotalTender)) return;
    			_TotalTender = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<double> _TotalTender;
        [DataMember]
    	public Nullable<double> TotalChange
    	{ 
    		get { return _TotalChange; }
    		set
    		{
    			if (Equals(value, _TotalChange)) return;
    			_TotalChange = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<double> _TotalChange;
        [DataMember]
    	public string Status
    	{ 
    		get { return _Status; }
    		set
    		{
    			if (Equals(value, _Status)) return;
    			_Status = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private string _Status;
        [DataMember]
    	public int StationId
    	{ 
    		get { return _StationId; }
    		set
    		{
    			if (Equals(value, _StationId)) return;
    			_StationId = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private int _StationId;
        [DataMember]
    	public int OpeningCashier
    	{ 
    		get { return _OpeningCashier; }
    		set
    		{
    			if (Equals(value, _OpeningCashier)) return;
    			_OpeningCashier = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private int _OpeningCashier;
        [DataMember]
    	public Nullable<int> ClosingCashier
    	{ 
    		get { return _ClosingCashier; }
    		set
    		{
    			if (Equals(value, _ClosingCashier)) return;
    			_ClosingCashier = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<int> _ClosingCashier;
        [DataMember]
    	public double Sales
    	{ 
    		get { return _Sales; }
    		set
    		{
    			if (Equals(value, _Sales)) return;
    			_Sales = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private double _Sales;
        [DataMember]
    	public int OpenTransactions
    	{ 
    		get { return _OpenTransactions; }
    		set
    		{
    			if (Equals(value, _OpenTransactions)) return;
    			_OpenTransactions = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private int _OpenTransactions;
        [DataMember]
    	public int CloseTransactions
    	{ 
    		get { return _CloseTransactions; }
    		set
    		{
    			if (Equals(value, _CloseTransactions)) return;
    			_CloseTransactions = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private int _CloseTransactions;
        [DataMember]
    	public byte[] EntryTimeStamp
    	{ 
    		get { return _EntryTimeStamp; }
    		set
    		{
    			if (Equals(value, _EntryTimeStamp)) return;
    			_EntryTimeStamp = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private byte[] _EntryTimeStamp;
        [DataMember]
    	public ObservableCollection<TransactionBase> TransactionBase
    	{
    		get { return _TransactionBase; }
    		set
    		{
    			if (Equals(value, _TransactionBase)) return;
    			_TransactionBase = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private ObservableCollection<TransactionBase> _TransactionBase;
        [DataMember]
    	public Station Station
    	{
    		get { return _Station; }
    		set
    		{
    			if (Equals(value, _Station)) return;
    			_Station = value;
    			StationChangeTracker = _Station == null ? null
    				: new ChangeTrackingCollection<Station> { _Station };
    			NotifyPropertyChanged();
    		}
    	}
    	private Station _Station;
    	private ChangeTrackingCollection<Station> StationChangeTracker { get; set; }
        [DataMember]
    	public Cashier OpenCashier
    	{
    		get { return _OpenCashier; }
    		set
    		{
    			if (Equals(value, _OpenCashier)) return;
    			_OpenCashier = value;
    			OpenCashierChangeTracker = _OpenCashier == null ? null
    				: new ChangeTrackingCollection<Cashier> { _OpenCashier };
    			NotifyPropertyChanged();
    		}
    	}
    	private Cashier _OpenCashier;
    	private ChangeTrackingCollection<Cashier> OpenCashierChangeTracker { get; set; }
        [DataMember]
    	public Cashier CloseCashier
    	{
    		get { return _CloseCashier; }
    		set
    		{
    			if (Equals(value, _CloseCashier)) return;
    			_CloseCashier = value;
    			CloseCashierChangeTracker = _CloseCashier == null ? null
    				: new ChangeTrackingCollection<Cashier> { _CloseCashier };
    			NotifyPropertyChanged();
    		}
    	}
    	private Cashier _CloseCashier;
    	private ChangeTrackingCollection<Cashier> CloseCashierChangeTracker { get; set; }
        [DataMember]
    	public ObservableCollection<TransactionBase> CloseTransactionBase
    	{
    		get { return _CloseTransactionBase; }
    		set
    		{
    			if (Equals(value, _CloseTransactionBase)) return;
    			_CloseTransactionBase = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private ObservableCollection<TransactionBase> _CloseTransactionBase;
    }
}
