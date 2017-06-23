using System.Drawing;
using System.Windows.Forms;

namespace SUT.PrintEngine.Controls.LoadScreen
{
    public partial class LoadScreen : Form
    {
        public LoadScreen()
        {
            var transparencyKey = Color.White;
            TransparencyKey = transparencyKey;
            BackColor = transparencyKey;
            InitializeComponent();
        }
    }
}
