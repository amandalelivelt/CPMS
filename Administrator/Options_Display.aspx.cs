using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Options_Display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // Set the page title.
        Master.PageTitle = "Display Administrator Options";
        // Set the message.
        Master.MessageForeColor = System.Drawing.Color.Green;
        Master.Message = "Please select from the options below.";

    }
}