using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Infra
{
    public class UploadFileHelper
    {
        public string SaveAs(string path, HttpPostedFileBase file)
        {
            if (file == null || 
                string.IsNullOrEmpty(file.FileName) ||
                file.ContentLength == 0)
            {
                throw new UploadFileNullException();
            }
            
            string ext = System.IO.Path.GetExtension(file.FileName);
            string newFileName = Guid.NewGuid().ToString("N") + ext;
            string fullPath = System.IO.Path.Combine(path, newFileName);

            file.SaveAs(fullPath);

            return newFileName;

        }
    }



    public class UploadFileNullException : ApplicationException
    {
    }
}