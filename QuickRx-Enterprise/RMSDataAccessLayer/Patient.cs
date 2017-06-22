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
    
    public partial class Patient : Person
    {
        public Patient()
        {
            this.Prescription = new ObservableCollection<Prescription>();
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
    
            ChangeTrackingCollection<Patient> _changeTracker;
    
            [NotMapped]
            [IgnoreDataMember]
            public ChangeTrackingCollection<Patient> ChangeTracker
            {
                get
                {
                    return _changeTracker;
                }
            }
            
            public new void StartTracking()
            {
                _changeTracker = new ChangeTrackingCollection<Patient>(this);
            }
        [DataMember]
    	public string Allergies
    	{ 
    		get { return _Allergies; }
    		set
    		{
    			if (Equals(value, _Allergies)) return;
    			_Allergies = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private string _Allergies;
        [DataMember]
    	public string Guardian
    	{ 
    		get { return _Guardian; }
    		set
    		{
    			if (Equals(value, _Guardian)) return;
    			_Guardian = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private string _Guardian;
        [DataMember]
    	public Nullable<double> Discount
    	{ 
    		get { return _Discount; }
    		set
    		{
    			if (Equals(value, _Discount)) return;
    			_Discount = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private Nullable<double> _Discount;
        [DataMember]
    	public ObservableCollection<Prescription> Prescription
    	{
    		get { return _Prescription; }
    		set
    		{
    			if (Equals(value, _Prescription)) return;
    			_Prescription = value;
    			NotifyPropertyChanged();
    		}
    	}
    	private ObservableCollection<Prescription> _Prescription;
    }
}
