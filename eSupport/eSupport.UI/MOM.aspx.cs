using eSupport.BL;
using eSupport.Core;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eSupport.UI
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMOMTable();
            }
        }



        [WebMethod]
        public static string BindMOMTable()
        {

            DataTable dt = new DataTable();

            List<MomBO> MomDetails = new List<MomBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objMomBL = new MomBL();
            dt = objMomBL.GetMomList();

            foreach (DataRow dtrow in dt.Rows)
            {
                DateTime temp = Convert.ToDateTime(dtrow["Date"]);

                var MomList = new MomBO
                {
                    //DateTime temp= dtrow["Date"].Date.ToS

                    tempDate = temp.ToString("MM/dd/yyy"),

                    Title = dtrow["Title"].ToString(),

                    //Facilitator = Convert.ToInt32(dtrow["Facilitator"]),

                    tempFacilitator = dtrow["tempFacilitator"].ToString(),

                    //Recorder = Convert.ToInt32(dtrow["Recorder"]),

                    tempRecorder = dtrow["tempRecorder"].ToString(),

                    LocationDetails = dtrow["LocationDetails"].ToString()
                };

                MomDetails.Add(MomList);
            }

            string JsonData = js.Serialize(MomDetails);
            return JsonData;


        }

    }
}