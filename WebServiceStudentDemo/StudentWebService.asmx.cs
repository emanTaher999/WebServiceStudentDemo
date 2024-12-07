using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebServiceStudentDemo
{
    /// <summary>
    /// Summary description for StudentWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class StudentWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public Student GetStudentById(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetStudentByID", con);
                cmd.CommandType= CommandType.StoredProcedure;
                SqlParameter parameter = new SqlParameter("@ID",id);
                cmd.Parameters.Add(parameter);
                Student student = new Student();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    student.ID = Convert.ToInt32(reader["ID"]);
                    student.Name = reader["Name"].ToString();
                    student.Gender = reader["Gender"].ToString();
                    student.TotalMarks =Convert.ToInt32(reader["TotalMarks"]);
                }
                return student;
            }
        }
    }
}
