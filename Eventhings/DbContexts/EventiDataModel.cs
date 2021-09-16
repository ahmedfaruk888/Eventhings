using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Eventhings.DbContexts
{
    public partial class EventiDataModel : DbContext
    {
        public EventiDataModel()
            : base("name=EventiConnectionString")
        {
        }

        public virtual DbSet<tcorerole> tcoreroles { get; set; }
        public virtual DbSet<tcoreuser> tcoreusers { get; set; }
        public virtual DbSet<tcoreuserrole> tcoreuserroles { get; set; }
        public virtual DbSet<tcorewallet> tcorewallets { get; set; }
        public virtual DbSet<tmstrcodestore> tmstrcodestores { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tcorerole>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tcorerole>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcorerole>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorerole>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorerole>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorerole>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorerole>()
                .HasMany(e => e.tcoreuserroles)
                .WithRequired(e => e.tcorerole)
                .HasForeignKey(e => e.role_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.user_code)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.email_confirmed)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.password_hash)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.phone_number)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.phone_number_confirmed)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.first_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.last_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.other_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuser>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreuser>()
                .HasMany(e => e.tcoreuserroles)
                .WithRequired(e => e.tcoreuser)
                .HasForeignKey(e => e.user_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tcoreuserrole>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuserrole>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreuserrole>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreuserrole>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.user_id)
                .IsUnicode(false);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.prev_balance)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.amount_paid)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.current_balance)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorewallet>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.batch_number)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.batcg_name)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.date_used)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcodestore>()
                .Property(e => e.updated_at)
                .HasPrecision(0);
        }
    }
}
