using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using Eventhings.DbEntities;

namespace Eventhings.DbContexts
{
    public partial class EventhingsDbContext : DbContext
    {
        public EventhingsDbContext()
            : base("name=EventhingsDbContext")
        {
        }

        public virtual DbSet<tcoreapplicant> tcoreapplicants { get; set; }
        public virtual DbSet<tcoreapplication> tcoreapplications { get; set; }
        public virtual DbSet<tcorecodestore> tcorecodestores { get; set; }
        public virtual DbSet<tcoreevent> tcoreevents { get; set; }
        public virtual DbSet<tcorehost> tcorehosts { get; set; }
        public virtual DbSet<tcoreitempoint> tcoreitempoints { get; set; }
        public virtual DbSet<tcoreitem> tcoreitems { get; set; }
        public virtual DbSet<tcorejob> tcorejobs { get; set; }
        public virtual DbSet<tcoremappedcode> tcoremappedcodes { get; set; }
        public virtual DbSet<tcorerole> tcoreroles { get; set; }
        public virtual DbSet<tcoretransaction> tcoretransactions { get; set; }
        public virtual DbSet<tcoreunitmeasurement> tcoreunitmeasurements { get; set; }
        public virtual DbSet<tcoreuserrole> tcoreuserroles { get; set; }
        public virtual DbSet<tcoreuser> tcoreusers { get; set; }
        public virtual DbSet<tcorewallet> tcorewallets { get; set; }
        public virtual DbSet<tmstrcategory> tmstrcategories { get; set; }
        public virtual DbSet<tmstrtranxchannel> tmstrtranxchannels { get; set; }
        //public virtual DbSet<tmstronaimo> tmstronaimos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.first_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.last_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.other_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.cover_letter)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.cv_ext)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.file_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.file_path)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplicant>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.urltest)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.urllive)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.createdby)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreapplication>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.batch_number)
                .IsUnicode(false);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.batch_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.date_used)
                .HasPrecision(0);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorecodestore>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreevent>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreevent>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreevent>()
                .Property(e => e.location)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreevent>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreevent>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreevent>()
                .HasMany(e => e.tcoremappedcodes)
                .WithRequired(e => e.tcoreevent)
                .HasForeignKey(e => e.event_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.full_name)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.phone)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorehost>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.item_id)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.cost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.point)
                .HasPrecision(20, 6);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitempoint>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.cost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreitem>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.job_title)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.state)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcorejob>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcorejob>()
                .HasMany(e => e.tcoreapplicants)
                .WithRequired(e => e.tcorejob)
                .HasForeignKey(e => e.job_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tcoremappedcode>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoremappedcode>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

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

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.channel)
                .IsUnicode(false);

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.tranx_amount)
                .HasPrecision(20, 6);

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoretransaction>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tcoreunitmeasurement>()
                .HasMany(e => e.tcoreitempoints)
                .WithRequired(e => e.tcoreunitmeasurement)
                .HasForeignKey(e => e.unit_id)
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

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrcategory>()
                .Property(e => e.updated_at)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.created_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.created_at)
                .HasPrecision(0);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.updated_by)
                .IsUnicode(false);

            modelBuilder.Entity<tmstrtranxchannel>()
                .Property(e => e.updated_at)
                .HasPrecision(0);
        }
    }
}
