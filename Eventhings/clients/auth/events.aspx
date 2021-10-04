<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="Eventhings.clients.auth.qrcode" %>


<asp:Content ID="headContentContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">

</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
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
        <form action="account.aspx" method="POST" id="frmAccount" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            New Host
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            New Event</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Manage Event
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Manage Host
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Manage all host information for any currently on-going or up-coming events</p>
                            </section>

                            <%--<div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Search... by phone or email">
                            </div>--%>

                            <div class="form-group col-md-4">
                                <label for="txtHostFullName">Full Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtHostFullName" required="required" name="txtHostFullName" placeholder="Farouq Ahmed">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtHostDescription">Description </label>
                                <input type="text" class="form-control" id="txtHostDescription" required="required" name="txtHostDescription" placeholder="Ahmed Host">
                            </div>
                            
                            <div class="form-group col-md-4">
                                <label for="txtHostPhone"> Phone Number <sup>*</sup></label>
                                <input type="tel" class="form-control" id="txtHostPhone" required="required" name="txtHostPhone" placeholder="+2348144488577">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtHostEmail"> Email <sup>*</sup></label>
                                <input type="email" class="form-control" id="txtHostEmail" required="required" name="txtHostEmail" placeholder="ahmedfaruk888@gmail.com">
                            </div>

                            <div class="form-group col-md-8">
                                <label for="txtHostAddress">Address <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtHostAddress" name="txtHostAddress" placeholder="11 folarin street, lagos">
                            </div>

                             <div class="form-group col-md-3">
                                <input id="chkEnableHost" checked="checked" name="chkEnableHost" type="checkbox" value="" />
                                <label for="chkEnableHost"> &nbsp; Enable this host by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveHost" class="btn btn-lg btn-primary mb-4">Create Host</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only map a single QR code text to a single user at a time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Mapped QR code text are QR code text that has been mapped to any customer, choose default event if for eventi.ng.
                        </p>
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Manage all account role information for user, customes retc</p>
                            </section>

                            <div class="form-group col-md-8">
                                <label for="cmbHost">Event Host<sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbHost" name="cmbHost">
                                    
                                </select>
                            </div>

                           <div class="form-group col-md-4">
                                <label for="txtEventName">Event Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtEventName" required="required" name="txtEventName" placeholder="Tuface Night">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtEventDescription">Description </label>
                                <input type="text" class="form-control" id="txtEventDescription" required="required" name="txtEventDescription" placeholder="Description">
                            </div>
                            
                            <div class="form-group col-md-8">
                                <label for="txtEventLocation"> Location <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtEventLocation" required="required" name="txtEventLocation" placeholder="Muson Centre, Ikoyi Lagos">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtEventStartDate"> Start Date </label>
                                <input type="date" class="form-control" id="txtEventStartDate" required="required" name="txtEventStartDate" placeholder="23/09/2021">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtEventEndtDate"> End Date </label>
                                <input type="date" class="form-control" id="txtEventEndtDate" required="required" name="txtEventEndtDate" placeholder="23/09/2021">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtEventDuration">Duration </label>
                                <input type="number" class="form-control" min="1" id="txtEventDuration" name="txtEventDuration" placeholder="2 days">
                            </div>

                             <div class="form-group col-md-3">
                                <input id="chkEnableEvent" checked="checked" name="chkEnableEvent" type="checkbox" value="" />
                                <label for="chkEnableEvent"> &nbsp; Enable this event by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveEvent" class="btn btn-lg btn-primary mb-4">Create Event</button>
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
                        <div class="form-group col-md-12">
                            <input type="text" class="form-control col-md-12" id="txtSearch1" name="txtSearch" placeholder="Search... by phone or email">
                        </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped table-bordered" style="width: 100%; font-size: .7rem;" id="eventTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Host</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Duration</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Active</th>
                                    <th scope="col">Created Date</th>
                                </tr>
                            </thead>
                            <tbody id="eventTBody">
                            </tbody>
                        </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>All Host Information</p>
                        </section>
                        <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch2" name="txtSearch" placeholder="Search... by phone or email">
                            </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped table-bordered"  style="width:100%; font-size: .7rem;" id="hostTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="mstrRoleChecked" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Active</th>
                                    <th scope="col">Created Date</th>
                                </tr>
                            </thead>
                            <tbody id="hostTBody">
                                
                            </tbody>
                        </table>
                        <div>
                    </div>
                </div>
            </div>
                <</div>
            </div>
        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        function GetEvents() {

            $.ajax({
                type: "POST",
                url: "/Services/events.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#eventTBody').empty();
                    $.each(responseData, function (i, row) {
                        let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.host_id}</td>
                                            <td>${row.name}</td>
                                            <td>${row.description}</td>
                                            <td>${row.location}</td>
                                            <td>${row.duration}</td>
                                            <td>${(row.start_date != undefined) ? "FROM - " + $.formattedDate(row.start_date) + " TO " + $.formattedDate(row.end_date) : " - "}</td >
                                            <td>${row.active}</td>                                           
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td>
                                        </tr>`;

                        $('#eventTBody').append(rows);
                    });
                    //$('#roleTable').DataTable();

                },
                beforeSend: function () {
                    $('#cmbUserType').append($("<option>Loading hosts..</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetHosts() {

            $.ajax({
                type: "POST",
                url: "/Services/hosts.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;

                    $('#cmbHost').empty();
                    $('#cmbHost').append($("<option></option>").val('0').html('-- Please choose host --'))
                    $.each(responseData, function (i, data) {

                        $('#cmbHost').append($("<option></option>").val(data.id).html(data.full_name));

                    });
                    $('#hostTBody').empty();
                    $.each(responseData, function (i, row) {
                        let rows = `<tr>
                                            <td>
                                                <div class="form-check">
                                                    <a href="#"><span class="fa fa-edit"> </span></a>
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.full_name}</td>
                                            <td>${row.description}</td>
                                            <td>${row.phone}</td>
                                            <td>${row.email}</td>
                                            <td>${row.address}</td>
                                            <td>${(row.active == 1) ? "Active Host" : "In-active Host"}</td>
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td>
                                        </tr>`;

                        $('#hostTBody').append(rows);
                    });
                    //$('#userTable').DataTable();
                },
                beforeSend: function () {
                    //$("#btnSaveAccount").attr('disabled', true);
                },
                complete: function () {
                    //$("#btnSaveAccount").attr('disabled', false);
                },
                error: function (data) {
                    console.log(data);
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });

        }

        $(document).ready(function () {

            //$('#cmbUserType').on('change', function () {
            //    if ($(this).val() == '1') {
            //        $('#walletDiv').css('display', 'inline');
            //    } else {
            //        $('#walletDiv').css('display', 'none');
            //    }

            //    if ($(this).val() == '3') {
            //        $('#attendantDiv').css('display', 'flex');
            //    } else {
            //        $('#attendantDiv').css('display', 'none');
            //    }
            //});

            $('label sup').css('color', 'red');

            GetHosts();
            GetEvents();

            //Save new role information
            $("#btnSaveHost").on('click', function (e) {

                e.preventDefault();

                var fullname = $("#txtHostFullName").val();
                var description = $("#txtHostDescription").val();
                var phone = $("#txtHostPhone").val();
                var email = $("#txtHostEmail").val();
                var address = $("#txtHostAddress").val();
                //var active = $("#chkEnableHost").prop('checked');

                if (fullname == '' || fullname.length < 1) {
                    $("#lblErrorText").html("Host full name is required"); return;
                }
                if (phone == '' || phone.length < 1) {
                    $("#lblErrorText").html("Host phone number is required"); return;
                }
                if (email == '' || email.length < 1) {
                    $("#lblErrorText").html("Host email address is required"); return;
                }
                if (address == '' || address.length < 1) {
                    $("#lblErrorText").html("Host office address is required"); return;
                }

                var hostdto = {

                    full_name :  fullname,
                    description :  description,
                    phone :  phone,
                    email :  email,
                    address: address,
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableHost').prop('checked') == true) ? 1 : 0,
                };

                var data = {
                    hostdto: hostdto
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/hosts.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmAccount').reset();

                            GetHosts();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveHost").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveHost").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });
        });
    </script>
</asp:Content>
