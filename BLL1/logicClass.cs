using BOL1;
using DAL1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL1
{
    public class logicClass
    {
        private dbCoursesClass objCourses;
        public logicClass()
        {
            objCourses = new dbCoursesClass();
        }

        public List<UniversityCouseViewModel> GetUniversityCousesData()
        {
            return objCourses.GetUniversityCousesData();
        }
        public List<UniversityCouseViewModel> SearchUniversityCousesData(string option,string search)
        {
            var data= objCourses.GetUniversityCousesData();
            List<UniversityCouseViewModel> obj = new List<UniversityCouseViewModel>();

            if (option== "Country")
            {
                return data.Where(x => x.country.ToUpper().Contains(search.ToUpper()) || search == null).ToList();
            }
            else if (option == "courseName")
            {
                return data.Where(x => x.courseName.ToUpper().Contains(search.ToUpper()) || search == null).ToList();
            }
            else if (option == "minimum_gpa")
            {
                return data.Where(x => x.minimum_gpa.ToString().Contains(search) || search == null).ToList();
            }
            else if(option == "minimum_gre_score") 
            {
                return data.Where(x => x.minimum_gre_score.ToString().Contains(search) || search == null).ToList();
            }
            return data;
        }

    }
}
