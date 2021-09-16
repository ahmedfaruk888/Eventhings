using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Eventhings.Interfaces
{
    public interface IGenericRepository<T> where T : class
    {
        IQueryable<T> FindAll();
        IQueryable<T> FindByCondition(Expression<Func<T, bool>> expression);
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);

        //Task<IEnumerable<T>> GetAllAsync();
        //Task DeleteRowAsync(Guid id);
        //Task<T> GetAsync(Guid id);
        //Task<int> SaveRangeAsync(IEnumerable<T> list);
        //Task UpdateAsync(T t);
        //Task InsertAsync(T t);
    }
}
