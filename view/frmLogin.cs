using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace view
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            timerLogin.Start();
        }

        private void timerLogin_Tick(object sender, EventArgs e)
        {
            lblRelogioLogin.Text = DateTime.Now.ToLongTimeString();
            lblDataLogin.Text = DateTime.Now.ToLongDateString();
        }

        private void btnAcessar_Click(object sender, EventArgs e)
        {

        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
