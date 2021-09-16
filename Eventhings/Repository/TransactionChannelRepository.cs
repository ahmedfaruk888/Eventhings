using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Eventhings.Interfaces;
using Eventhings.DbEntities;

namespace Eventhings.Repository
{
    public class TransactionChannelRepository : AbstractGenericRepository<TCoreTransactionChannel>, ITransactionChannelRepository
    {
        public List<TCoreTransactionChannel> GetTransaction(int id)
        {
            throw new NotImplementedException();
        }

        public List<TCoreTransactionChannel> GetTransactions()
        {
            throw new NotImplementedException();
        }
    }
}