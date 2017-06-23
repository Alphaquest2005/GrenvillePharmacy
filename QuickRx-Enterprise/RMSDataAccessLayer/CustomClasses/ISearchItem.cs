namespace RMSDataAccessLayer
{
    public interface ISearchItem
    {
        string SearchCriteria
        {
            get;
        }
        string DisplayName
        {
            get;
           
        }
        string Key
        {
            get;
        }
    }
}
