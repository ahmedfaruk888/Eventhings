using Eventhings.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Eventhings.Repository
{
    public class Repository/*<T> : IRepository<T> where T : class*/
    {
        //protected EventhingsContext _context { get; set; }
        //public RepositoryBase(EventhingsContext repositoryContext)
        //{
        //    this._context = repositoryContext;
        //}
        //public IQueryable<T> FindAll()
        //{
        //    return this.EventhingsContext.Set<T>().AsNoTracking();
        //}
        //public IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression)
        //{
        //    return this.EventhingsContext.Set<T>().Where(expression).AsNoTracking();
        //}
        //public void Create(T entity)
        //{
        //    this.EventhingsContext.Set<T>().Add(entity);
        //}
        //public void Update(T entity)
        //{
        //    this.EventhingsContext.Set<T>().Update(entity);
        //}
        //public void Delete(T entity)
        //{
        //    this.EventhingsContext.Set<T>().Remove(entity);
        //}
    }
}