//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KYSv2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class menuRole
    {
        public int menuRoleID { get; set; }
        public int menuId { get; set; }
        public int roleID { get; set; }
    
        public virtual menu menu { get; set; }
        public virtual role role { get; set; }
    }
}
