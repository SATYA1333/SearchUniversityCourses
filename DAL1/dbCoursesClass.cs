using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BOL1;

namespace DAL1
{
   public class dbCoursesClass
    {
        private UniversityCoursesEntity db;
        public dbCoursesClass()
        {
            db = new UniversityCoursesEntity();
        }
        public List<Cours> getAllCoursesData()
        {
            return db.Courses.ToList();
        }
        public List<UniversityCouseViewModel> GetUniversityCousesData()
        {
            List<UniversityCouseViewModel> couseViewModels = new List<UniversityCouseViewModel>();
            var details = (from University in db.Universities
                           join Cours in db.Courses on University.id equals Cours.university_id
                           select new { universityname = University.name, University.country, University.minimum_gpa, University.minimum_gre_score, couseName = Cours.name }).ToList();

            foreach (var item in details)
            {
                UniversityCouseViewModel obj = new UniversityCouseViewModel();
                obj.courseName = item.couseName;
                obj.country = item.country;
                obj.universityName = item.universityname;
                obj.minimum_gpa = item.minimum_gpa;
                obj.minimum_gre_score = item.minimum_gre_score;
                couseViewModels.Add(obj);


            }
            return couseViewModels;
        }
    }
}
