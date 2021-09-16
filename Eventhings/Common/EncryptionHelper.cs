using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Eventhings.Common
{
    public class EncryptionHelper
    {
        public static class AESEncryptionUtil
        {
            //public static string SanitizeEncrypyedText()
            //{
            //    string _urlSafeencToken = encToken.TrimEnd('=').Replace('+', '-').Replace('/', '_');
            //}

            public static byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
            {
                byte[] encryptedBytes = null;
                // Set your salt here, change it to meet your flavor:  
                // The salt bytes must be at least 8 bytes.  
                //byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
                using (MemoryStream ms = new MemoryStream())
                {
                    using (RijndaelManaged aes = new RijndaelManaged())
                    {
                        //aes.KeySize = 128;
                        aes.Padding = PaddingMode.PKCS7;
                        //aes.BlockSize = 128;
                        //var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                        aes.Key = passwordBytes; //key.GetBytes(aes.KeySize / 8);
                                                 //aes.IV = aes.IV; /*key.GetBytes(aes.BlockSize / 8);*/
                        aes.Mode = CipherMode.ECB;
                        using (var cs = new CryptoStream(ms, aes.CreateEncryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                            cs.Close();
                        }
                        encryptedBytes = ms.ToArray();
                    }
                }
                return encryptedBytes;
            }
            public static byte[] AES_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
            {
                try
                {
                    byte[] decryptedBytes = null;
                    // Set your salt here, change it to meet your flavor:  
                    // The salt bytes must be at least 8 bytes.  
                    //byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (RijndaelManaged AES = new RijndaelManaged())
                        {
                            AES.Padding = PaddingMode.PKCS7;
                            AES.Key = passwordBytes;
                            //AES.KeySize = 128;
                            //AES.BlockSize = 128;
                            //var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                            //AES.Key = key.GetBytes(AES.KeySize / 8);
                            //AES.IV = key.GetBytes(AES.BlockSize / 8);
                            AES.Mode = CipherMode.ECB;
                            using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
                            {
                                cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
                                cs.Close();
                            }
                            decryptedBytes = ms.ToArray();
                        }
                    }
                    return decryptedBytes;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            public static string EncryptTextToBase64String(string input, string password)
            {
                try
                {
                    // Get the bytes of the string  
                    byte[] bytesToBeEncrypted = Encoding.ASCII.GetBytes(input);
                    byte[] passwordBytes = Encoding.ASCII.GetBytes(password);
                    // Hash the password with SHA256  
                    //passwordBytes =  SHA256.Create().ComputeHash(passwordBytes);
                    byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);
                    string result = Convert.ToBase64String(bytesEncrypted);
                    return result;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            public static string DecryptTextFromBase64String(string input, string password)
            {
                try
                {
                    // Get the bytes of the string  
                    byte[] bytesToBeDecrypted = Convert.FromBase64String(input);
                    byte[] passwordBytes = Encoding.ASCII.GetBytes(password);
                    //passwordBytes = SHA256.Create().ComputeHash(passwordBytes);
                    byte[] bytesDecrypted = AES_Decrypt(bytesToBeDecrypted, passwordBytes);
                    string result = Encoding.ASCII.GetString(bytesDecrypted);
                    return result;
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}