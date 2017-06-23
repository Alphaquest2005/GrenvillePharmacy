using System.Windows;

namespace QuickSales
{
    /// <summary>
    /// Interaction logic for Shell.xaml
    /// </summary>
    public partial class Shell : Window
    {
        public Shell()
        {
            InitializeComponent();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            App app = Application.Current as App;
            app.LoginRoutine();

        }

      
    }
}
