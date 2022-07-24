namespace HealthInsuranceService.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class HealthInsuranceDB : DbContext
    {
        public HealthInsuranceDB() : base("name=HealthInsuranceDB")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<HealthInsuranceDB, Migrations.Configuration>("HealthInsuranceDB"));
        }

        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Hospital> Hospitals { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Policy> Policies { get; set; }
        public virtual DbSet<PoliciesOnEmployee> PoliciesOnEmployees { get; set; }
        public virtual DbSet<PolicyRequest> PolicyRequests { get; set; }
        public virtual DbSet<PolicyApproval> PolicyApprovals { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            
        }
    }
}
