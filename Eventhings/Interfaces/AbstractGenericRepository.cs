using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using Eventhings.Interfaces;


namespace Eventhings.Interfaces
{
    public abstract class AbstractGenericRepository<T> : IGenericRepository<T> where T : class
    {
        //private string _tableName;
        public AbstractGenericRepository()
        {
        }

        //public MySqlConnection MySqlConnection()
        //{
        //    return new MySqlConnection(ConfigurationManager.ConnectionStrings["defaultConnectionString"].ConnectionString);
        //}

        //public IDbConnection CreateConnection()
        //{
        //    var conn = MySqlConnection();
        //    conn.Open();
        //    return conn;
        //}

        public void Create(T entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(T entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<T> FindAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression)
        {
            throw new NotImplementedException();
        }

        public void Update(T entity)
        {
            throw new NotImplementedException();
        }
    }
}