using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eventhings.DbEntities;

namespace Eventhings.Interfaces
{
    public interface ITransactionChannelRepository
    {
        List<TCoreTransactionChannel> GetTransactions();
        List<TCoreTransactionChannel> GetTransaction(int id);
    }
}
