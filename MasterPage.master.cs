using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class MasterPage : System.Web.UI.MasterPage
{

    public String PageTitle
    {
        set { lblPageTitle.Text = value; }
    }
    
    public System.Drawing.Color MessageForeColor
    {
        set { lblMessage.ForeColor = value; }
    }

    public String Message
    {
        set { lblMessage.Text = value; }
    }

    public String LogoutText
    {
        set { btnLogout.Text = value; }
    }

    public String UserName
    {
        set { lblUser.Text = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["booValidLicense"] = true;

        // Set the user.
        lblUser.Text = (String)Session["strUser"];

        // Set the server name.
        lblServerName.Text = Request.ServerVariables["Server_Name"];

        // Set the version number.
        lblVersion.Text = "1.1";

        // Set the date.
        lblDate.Text = DateTime.Today.ToShortDateString();

        // Set the contact.
        lblContact.Text = "If you have questions or experience problems with this website, please contact....";

    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {

        // Redirect the user.
        Response.Redirect("~/Login_Enter.aspx");

    }
}
