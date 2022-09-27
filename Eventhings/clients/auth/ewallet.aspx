<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="ewallet.aspx.cs" Inherits="Eventhings.clients.auth.ewallet" %>

<asp:Content ID="headContentContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var user = JSON.parse(sessionStorage.getItem('user'));
        if (user.role_name !== 'administrator') {

            var currentPathName = window.location.href;
            window.location.replace("../login.html?redirect=" + currentPathName);
        }
    </script>
</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
    <%--<section class="page-header" style="padding-top: 20px">
        <h5>Manage QR Codes</h5>
        <h7>Generate new QR codes, manage exisiting code by batch and date.</h7>
    </section>--%>
    <section class="contact-content">
        <div class="contact-widget media">
            <img src="../assets/images/icon-4.png" alt="monitor" width="50">
            <div class="media-body">
                <h6 class="widget-title">New</h6>
                <p class="widget-content">Geneate new QR Code for an event</p>
            </div>
        </div>
        <div class="contact-widget media">
            <img src="../assets/images/icon-5.png" alt="Eventi.ng.-Book" width="40">
            <div class="media-body">
                <h6 class="widget-title">De-activate</h6>
                <p class="widget-content">Having issues with a customer QR code, deativate it here</p>
            </div>
        </div>
    </section>
    <div class="row">
        <div class="alert alert-info alert-dismissible" id="divAlert">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p id="lblErrorText">

            </p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="ewallet.aspx" method="POST" id="frmWallet" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-bs-toggle="tab" data-bs-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Top Up Wallet
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            View Wallet Transaction</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Settings
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <h5>Top Up Customer Wallet</h5>
                            </section>

                            <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Enter customer phone number">
                            </div>

                            <div class="row" id="topUpDiv">
                                <div class="form-group col-md-8">
                                    <label for="txtFullName">Customer Full Name <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtFullName" readonly="readonly" name="txtFullName" placeholder="">
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="txtCurrentBalance">Current Balance <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtCurrentBalance" readonly="readonly" name="txtCurrentBalance" placeholder="0">
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="txtCurrentPoint">Current Point <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtCurrentPoint" readonly="readonly" name="txtCurrentPoint" placeholder="0">
                                </div>

                                <div class="form-group col-md-3">
                                    <div class="card border border-primary shadow-0 pl-3 pr-3">
                                        <div class="bg-image hover-overlay ripple" data-bs-ripple-color="light">
                                            <img src="https://res.cloudinary.com/imtechnetronics/image/upload/v1633383459/eventi/sterling_spyue8.png" 
                                                class="img-fluid" />
                                            <a href="#!"><div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
                                            </a>
                                        </div>

                                        <div class="card-body">
                                            <p class="card-text">
                                                <b>Direct Bank Deposit</b> <br />
                                                Account: <b>0229819219290</b> <br /> <b>USSD: *737*2*Amount*Account#</b>
                                            </p>

                                        </div>
                                        <div class="card-footer align-content-end">
                                            <button type="button" id="btnSterling" class="btn btn-outline-danger btn-rounded" data-bs-ripple-color="#000000"> Pay with Sterling  bank </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <div class="card border border-primary shadow-0 pl-3 pr-3">
                                        <div class="bg-image hover-overlay ripple" data-bs-ripple-color="light">
                                            <img src="https://res.cloudinary.com/imtechnetronics/image/upload/v1633383458/eventi/paystack_qt6zjj.png" 
                                                class="img-fluid" />
                                            <a href="#!"><div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
                                            </a>
                                        </div>

                                        <div class="card-body">
                                            <p class="card-text">
                                                <b>Direct Bank Deposit</b> <br />
                                                Account: <b>0229819219290</b> <br /> <b>USSD: *737*2*Amount*Account#</b>
                                            </p>

                                        </div>
                                        <div class="card-footer align-content-end">
                                            <button type="button" id="btnPayStack" class="btn btn-outline-primary btn-rounded" data-bs-ripple-color="#000000"> Pay with Paystack </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <div class="card border border-primary shadow-0 pl-3 pr-3">
                                        <div class="bg-image hover-overlay ripple" data-bs-ripple-color="light">
                                            <img src="https://res.cloudinary.com/imtechnetronics/image/upload/v1633383459/eventi/flutter_aeodj5.png" 
                                                class="img-fluid" />
                                            <a href="#!"><div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
                                            </a>
                                        </div>

                                        <div class="card-body">
                                            <p class="card-text">
                                                <b>Direct Bank Deposit</b> <br />
                                                Account: <b>0229819219290</b> <br /> <b>USSD: *737*2*Amount*Account#</b>
                                            </p>

                                        </div>
                                        <div class="card-footer align-content-end">
                                            <button type="button" id="btnFlutter" class="btn btn-outline-warning btn-rounded" data-bs-ripple-color="#000000"> Pay with Flutterwave </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-3" id="amountDiv">
                                    <h5>Top Up</h5>
                                    <%--<p>How much will you like to top-up for this customer, minimum amount 1,000</p>--%>
                                    <label for="txtCodeCount">Amount<sup>*</sup></label>
                                    <input type="number" min="1" max="50" class="form-control" id="txtTopUpAmount" name="txtTopUpAmount" placeholder="Between 1000 - nth thousand"/> <br />
                                    <label for="txtTopPoint">Point<sup>*</sup></label>
                                    <input type="number" min="1" max="50" class="form-control" id="txtTopPoint" name="txtTopPoint" placeholder="Between 1000 - nth thousand"/> <br />
                                    <button type="button" id="btnSaveTopUp" class="btn btn-lg btn-primary mb-4">Save Customer Top Up</button>
                                </div>
                            </div>

                           <%-- <div class="text-right">
                                
                            </div>--%>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only top up using cash at the moment, payment gateway topup is coming soon.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <h5>Manage all current customer e-wallet transaction</h5>
                            </section>
                            <div class="form-group col-md-12">
                            <input type="text" class="form-control col-md-12" id="txtSearch1" name="txtSearch" placeholder="Search... by phone or email">
                        </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped table-bordered" style="width: 100%; " id="walletTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Point</th>
                                    <th scope="col">Channel</th>
                                    <th scope="col">Prv. Balance</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Cur. Balance</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">By</th>
                                    <th scope="col">Date</th>
                                </tr>
                            </thead>
                            <tbody id="walletTBody">
                            </tbody>
                        </table>
                        </div>
                            
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            All user information
                        </p>
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        function GetCustomerWalletTranxHistory() {
            var wallet = {
                user_id: user_id
            }
            var data = {
                wallet: wallet
            }

            $.ajax({
                type: "POST",
                url: "/Services/e-wallet.asmx/GetWalletTranxHistory",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#walletTBody').empty();
                    $.each(responseData, function (i, row) {

                        //// convert MVC datetime (e.g. "\/Date(628318530718)\/") into JavaScript Date
                        //var value = new Date(parseInt(value.replace("/Date(", "").replace(")/", ""), 10));
                        let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${$('#txtFullName').val()}</td>
                                            <td>${row.point}</td>
                                            <td>${row.payment_channel}</td> <td>${row.prev_balance}</td> <td>${row.amount_paid}</td> <td>${row.current_balance}</td>
                                            <td>${(row.active == 1) ? "Active" : "In-active"}</td>
                                            <td>${(row.created_by == undefined) ? " - " : row.created_by}</td>
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td>
                                        </tr>`;

                        $('#walletTBody').append(rows);
                    });
                    //$('#roleTable').DataTable();

                },
                beforeSend: function () {
                    $('#cmbUserType').append($("<option>Loading roles..</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetWalletBalance(phone) {

            var wallet = {
                phone_number: phone
            }
            var data = {
                wallet: wallet
            }

            $.ajax({
                url: '/Services/e-wallet.asmx/Get',
                dataType: 'text',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data),
                success: function (response) {
                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    //txtCurrentPoint
                    if (responseData.current_balance == null || responseData.current_balance == undefined || responseData.current_balance == '0') {
                        $('#txtCurrentBalance').val(0 + " Naira");
                    } else {
                        $('#txtCurrentBalance').val(responseData.current_balance);
                    }

                    if (responseData.current_balance == null || responseData.current_balance == undefined || responseData.current_balance == '0') {
                        $('#txtCurrentPoint').val(0 + " Point");
                    } else {
                        $('#txtCurrentPoint').val(responseData.point);
                    }
                },
                error: function (data) {
                    console.log(errorThrown);
                }
            });
        }

        function GetCustomer(phone) {
            var user = {
                phone_number: phone
            }
            var data = {
                user: user
            };
            $.ajax({
                type: "POST", url: "/Services/authenticate.asmx/GetCustomerByPhone", dataType: "json", contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                success: function (response) {
                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;
                    if (status >= '1') {

                        //txtCurrentBalance
                        user_id = responseData.id;
                        $('#txtFullName').val(responseData.last_name + " " + responseData.first_name);

                        $('#topUpDiv button').attr('disabled', false);

                        //Get wallet details
                        GetCustomerWalletTranxHistory(responseData.phone_number);
                    }
                    else if (status == '0') {
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);
                        return;
                    }
                },
                error: function (data) {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        var payment_channel = '';
        var user_id = '';

        $(document).ready(function () {

            $('label sup').css('color', 'red');
            $('#walletDiv').css('display', 'none');
            $('#topUpDivxxx').css('display', 'none');
            $('#amountDiv').css('display', 'none');
            $('#divAlert').css('display', 'none');

            $('#topUpDiv button').not('#btnSaveTopUp').attr('disabled', true);

            $('#btnSterling').on('click', function () {
                payment_channel = "Bank Payment (POS or Bank Transfer)  Top-Up";
                $('#amountDiv').toggle();
            });
            $('#btnPayStack').on('click', function () {
                payment_channel = "Payment Gateway - Paystack";
                $('#divAlert').toggle();
                $("#lblErrorText").html("Payment using the paystack payment gateway is not available yet, check back later");
            });
            $('#btnFlutter').on('click', function () {
                payment_channel = "Bank Payment (Payment Gateway - Flutterwave)";
                $('#divAlert').toggle();
                $("#lblErrorText").html("Payment using the flutterwave payment gateway is not available yet, check back later");
            });

            //Get all customer tranx history
            //GetCustomerWalletTranxHistory();
            var s = window.location.search;
            console.log(s);
            if (s == '' || s == null || s == undefined) {

                $("#myTabContent0").hide();

            } else {

                var p = window.location.search.split('=')[1];
                GetWalletBalance(window.location.search.split('=')[1]);
                GetCustomer(p);

            }
            GetCustomerWalletTranxHistory();

            //Search by phone
            var _phone = '';
            $('#txtSearch').on('keypress', function (e) {
                if (e.which == 13) {

                    _phone = $(this).val();

                    GetCustomer(_phone);

                    e.preventDefault();
                }
                else
                    return;
            });

            //Save new e-wallet information
            $("#btnSaveTopUp").on('click', function (e) {

                var point = $("#txtTopPoint").val();
                var amount = $("#txtTopUpAmount").val();
                var fullname = $("#txtFullName").val();

                if (point == '' || point.length < 1) {
                    $('#divAlert').css('display', 'inline');
                    $("#lblErrorText").html("Point is required");
                    $("#txtTopPoint").focus();
                    return;
                }
                if (amount == '' || amount.length < 1) {
                    $('#divAlert').css('display', 'inline');
                    $("#lblErrorText").html("Amount is required");
                    $("#txtTopUpAmount").focus();
                    return;
                }
                if (fullname == '' || fullname.length < 1) {
                    $('#divAlert').css('display', 'inline');
                    $("#lblErrorText").html("Customer full name is required, please enter customer phone and search");
                    return;
                }


                var wallet = {
                    user_id: user_id,
                    point: $("#txtTopPoint").val(),
                    payment_channel: payment_channel,
                    amount_paid: $("#txtTopUpAmount").val(),
                    created_by: sessionStorage.getItem('email'),
                    cr_type: 2
                };

                var data = {
                    wallet: wallet
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/e-wallet.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            //document.getElementById('frmWallet').reset();
                            var p = window.location.search.split('=')[1];
                            GetCustomerWalletTranxHistory();
                            GetCustomer(p);
                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveAccount").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveAccount").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });

                e.preventDefault();
            });
        });
    </script>
</asp:Content>
