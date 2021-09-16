using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eventhings.Common;
using Eventhings.Response;
using Newtonsoft.Json;
using Eventhings.DbContexts;
using Eventhings.Dto;
using System.Web.ModelBinding;

namespace Eventhings.admin
{
    public partial class qrcodegen : System.Web.UI.Page
    {
        public List<tmstrcodestore> _million;
        private EventiDataModel _context = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            _million = new List<tmstrcodestore>();
            this.txtBatchNumber.Value = "QC-" + new Random().Next().ToString();

            
        }

        [WebMethod(EnableSession = true)]
        public static object ActiveQrCode(int activestatus)
        {
            List<tmstrcodestore> million;
            using (var context = new EventiDataModel())
            {
                var data = context.tmstrcodestores
                    .Where(p => p.active == activestatus).ToList<tmstrcodestore>();

                million = data;
            }

            return JsonConvert.SerializeObject(million);
        }

        protected void btnGenerateCode_ServerClick(object sender, EventArgs e)
        {
            using (_context = new EventiDataModel())
            {
                //Call the generate random guid

                var codeCount = Convert.ToInt32(this.txtCodeCount.Value);
                var randomGuid = GetRandomGuid(codeCount);
                var active = chkActive.Checked;

                if(randomGuid.Count > 0)
                {
                    //IEnumerable<tmstrcodestore> codeCollection;
                    foreach(var ss in randomGuid)
                    {
                        _context.tmstrcodestores.AddRange(new List<tmstrcodestore>() { new tmstrcodestore()
                        {
                            batch_number = txtBatchNumber.Value.Trim(),
                            batcg_name = txtBatcgName.Value.Trim(),
                            code = ss.Value,
                            active = (active) ? 1 : 0,
                            is_deleted = 0,
                            created_by = "Admin"
                        } });
                    }
                }

                var rowsAffected = _context.SaveChanges();
                if (rowsAffected > 0)
                {
                    //retrieve the newly created code
                    var data = _context.tmstrcodestores.Where(x => x.batch_number == txtBatchNumber.Value.Trim()).ToList<tmstrcodestore>();
                    _million = data;
                    //{
                    //    SN = c.id,
                    //    BatchNumber = c.batch_number,
                    //    BatchName = c.batcg_name,
                    //    CodeText = c.code
                    //});
                }
            }

        }

        public static Dictionary<int, string> GetRandomGuid(int value)
        {
            //var response = new ResponseMessage();

            //string[] TenMillionsId = new string[value];
            Dictionary<int, string> million = new Dictionary<int, string>();

            for (int i = 0; i < value; i++)
            {
                Guid h = Guid.NewGuid();
                million.Add(i, h.ToString());
                //TenMillionsId[i] = h.ToString();
            }

            //response.Status = 1;
            //response.Message = TenMillionsId;

            return million;
        }

        [WebMethod(EnableSession = true)]
        public static object Save()
        {
            var _response = new ResponseMessage();
            var randomCode = RandomString(7, false);
            _response.Status = (randomCode.Length >= 1) ? 1 : 0;
            _response.Message = randomCode;

            return _response;
        }

        private static Random randomSeed = new Random();

        /// <summary>
        /// Generates a random string with the given length
        /// </summary>
        /// <param name="size">Size of the string</param>
        /// <param name="lowerCase">If true, generate lowercase string</param>
        /// <returns>Random string</returns>
        public static string RandomString(int size, bool lowerCase)
        {
            // StringBuilder is faster than using strings (+=)
            StringBuilder RandStr = new StringBuilder(size);

            // Ascii start position (65 = A / 97 = a)
            int Start = (lowerCase) ? 97 : 65;

            // Add random chars
            for (int i = 0; i < size; i++)
                RandStr.Append("QR-" + (char)(26 * randomSeed.NextDouble() + Start));

            return RandStr.ToString();
        }

        /// <summary>
        /// Returns a random number.
        /// </summary>
        /// <param name="min">Minimal result</param>
        /// <param name="max">Maximal result</param>
        /// <returns>Random number</returns>
        public static int RandomNumber(int Minimal, int Maximal)
        {
            lock (randomSeed)
            {
                return randomSeed.Next(Minimal, Maximal);
            }
        }

        public static int GetRandom(int maxValue)
        {
            lock (randomSeed)
            {
                return randomSeed.Next(maxValue);
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetRandomNumber()
        {
            var _response = new ResponseMessage();

            StringBuilder RandStr = new StringBuilder(20);

            for (int i = 1; i <= 20; i++)
            {
                var randomCode = new Random().Next(100, 10000).ToString();

                //tt.Id = i;
                //tt.Code = randomCode;

                RandStr.Append(randomCode);
            }

            _response.Status = 1;
            _response.Message = RandStr;

            return _response;
        }
    }
}