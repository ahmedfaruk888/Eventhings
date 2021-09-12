<%@ Page Title="" Language="C#" MasterPageFile="~/admin/site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Eventhings.admin.dashbaord" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div class="content">
        <div class="">
            <div class="page-header-title">
                <h4 class="page-title">Dashboard</h4>
            </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <form action="admin/dashboard.aspx" method="post" runat="server" id="frmDashboard">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-user widget-box-icon"></i>
                                        <h4 class="panel-title m-b-15 text-muted font-light">Total Subscription</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-down-bold-circle-outline m-r-10"></i>89,52,125</h2>
                                        <p class=" m-b-0 m-t-20 text-muted text-full"><b>48%</b> From Last 24 Hours</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-eye widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Unique Visitors</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-up-bold-circle-outline m-r-10"></i>4,52,564</h2>
                                        <p class="text-muted m-b-0 m-t-20 text-full"><b>22%</b> From Last 24 Hours</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-stats-up widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Order Status</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-up-bold-circle-outline m-r-10"></i>65,21,542</h2>
                                        <p class="m-b-0 m-t-20 text-muted text-full"><b>42%</b> Orders in Last 10 months</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-world widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Monthly Earnings</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-down-bold-circle-outline m-r-10"></i>56,21,256</h2>
                                        <p class="text-muted m-b-0 m-t-20 text-full"><b>35%</b> From Last 1 Month</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="panel">
                            <div class="panel-body">
                                <h4 class="m-b-30 m-t-0">Recent Transactions</h4>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="table-responsive">
                                            <table class="table table-hover m-b-0">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Position</th>
                                                        <th>Office</th>
                                                        <th>Age</th>
                                                        <th>Start date</th>
                                                        <th>Salary</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Tiger Nixon</td>
                                                        <td>System Architect</td>
                                                        <td>Edinburgh</td>
                                                        <td>61</td>
                                                        <td>2011/04/25</td>
                                                        <td>$320,800</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Garrett Winters</td>
                                                        <td>Accountant</td>
                                                        <td>Tokyo</td>
                                                        <td>63</td>
                                                        <td>2011/07/25</td>
                                                        <td>$170,750</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ashton Cox</td>
                                                        <td>Junior Technical Author</td>
                                                        <td>San Francisco</td>
                                                        <td>66</td>
                                                        <td>2009/01/12</td>
                                                        <td>$86,000</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Cedric Kelly</td>
                                                        <td>Senior Javascript Developer</td>
                                                        <td>Edinburgh</td>
                                                        <td>22</td>
                                                        <td>2012/03/29</td>
                                                        <td>$433,060</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Airi Satou</td>
                                                        <td>Accountant</td>
                                                        <td>Tokyo</td>
                                                        <td>33</td>
                                                        <td>2008/11/28</td>
                                                        <td>$162,700</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Brielle Williamson</td>
                                                        <td>Integration Specialist</td>
                                                        <td>New York</td>
                                                        <td>61</td>
                                                        <td>2012/12/02</td>
                                                        <td>$372,000</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Herrod Chandler</td>
                                                        <td>Sales Assistant</td>
                                                        <td>San Francisco</td>
                                                        <td>59</td>
                                                        <td>2012/08/06</td>
                                                        <td>$137,500</td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
