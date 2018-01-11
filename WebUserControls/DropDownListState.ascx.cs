using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_DropDownListState : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public String SelectedValue
    {

        get { return ddlState.SelectedValue; }
        set { ddlState.SelectedValue = value; }

    }

    public Boolean Enabled
    {

        set { ddlState.Enabled = value; }
    
    }

}