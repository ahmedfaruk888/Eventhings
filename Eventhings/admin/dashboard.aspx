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
                                        <h4 class="panel-title m-b-15 text-muted font-light">Total Transaction</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-down-bold-circle-outline m-r-10"></i>0</h2>
                                        <p class=" m-b-0 m-t-20 text-muted text-full"><b>0%</b> From Last 24 Hours</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-eye widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Total Sames</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-up-bold-circle-outline m-r-10"></i>0</h2>
                                        <p class="text-muted m-b-0 m-t-20 text-full"><b>0%</b> From Last 24 Hours</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-stats-up widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Active Qr Code</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-up-bold-circle-outline m-r-10"></i>0</h2>
                                        <p class="m-b-0 m-t-20 text-muted text-full"><b>0%</b> From Last 10 months</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="panel">
                                <div class="panel-body p-t-10">
                                    <div class="widget-box-one">
                                        <i class="ti-world widget-box-icon"></i>
                                        <h4 class="panel-title text-muted m-b-15 font-light">Total Customer</h4>
                                        <h2 class="m-t-0 text-primary m-b-15"><i class="mdi mdi-arrow-down-bold-circle-outline m-r-10"></i>0</h2>
                                        <p class="text-muted m-b-0 m-t-20 text-full"><b>0%</b> From Last 1 Month</p>
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
                                                        <th>Tranx Type</th>
                                                        <th>Amount</th>
                                                        <th>Tranx Date</th>
                                                        <th>Tranx Channel</th>
                                                        <th>Customer Name</th>
                                                        <th>Tranx Status</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <%--<tr>
                                                        <td>Tiger Nixon</td>
                                                        <td>System Architect</td>
                                                        <td>Edinburgh</td>
                                                        <td>61</td>
                                                        <td>2011/04/25</td>
                                                        <td>$320,800</td>
                                                    </tr>--%>
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
