namespace RMSDataAccessLayer
{
    public partial class Company
    {
        public string AddressInfo
        {
            get { return Address + " " + Address1 + " " + " " + PhoneNumber; }
        }
    }
}
