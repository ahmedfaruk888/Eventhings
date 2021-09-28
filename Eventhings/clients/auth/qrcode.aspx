<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="qrcode.aspx.cs" Inherits="Eventhings.clients.auth.qrcode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <style type="text/css">
        .error {
            color: maroon;
            font-size: 10px;
        }
    </style>
</asp:Content>


<asp:Content ID="pageHeaderContent" runat="server" ContentPlaceHolderID="pageHeaderContentPlaceHolder">
    <%--<section class="page-header" style="padding-top: 20px">
        <h2>Manage QR Codes</h2>
        <h5>Generate new QR codes, manage exisiting code by batch and date.</h5>
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
        <div class="alert alert-danger alert-dismissible" id="divAlert" style="display:none">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p id="lblErrorText">Error messages or success messages displays here.</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="qrcode.aspx" method="POST" id="frmQrcode" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            New QR Code Text
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            Mapped QR Code Text</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Un-Mapped - Active QR Code Text
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Print From Store - By Batch 
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Generate New QR Codes</p>
                            </section>
                            <div class="form-group col-md-4" id="insert-batch-number">
                                <label for="txtBatchNumber">Batch Number <sup>*</sup></label>
                                <a href="#" class="batch-edit" onclick="javascript:void(0)"><span class="fa fa-edit"></span></a>
                                <input type="text" class="form-control" readonly="readonly" id="txtBatchNumber" required="required" name="txtBatchNumber" placeholder="BT-55363676">

                                <select class="form-control" id="cmbBatchNumber" name="cmbBatchNumber">
                                    <%--<option value="value">--Please choose one--</option>
                                    <option value="value">--Please choose one--</option>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-4" id="insert-batch-name">
                                <label for="txtBatchName">Batch Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtBatchName" name="txtBatchName" placeholder="Evening batch">

                                <select class="form-control" id="cmbBatchName" name="cmbBatchName">
                                    <%--<option value="value">--Please choose one--</option>
                                    <option value="value">--Please choose one--</option>--%>
                                </select>
                            </div>

                            
                            <div class="form-group col-md-4">
                                <label for="txtCodeCount">Generated Code Count <sup>*</sup></label>
                                <input type="number" min="1" max="50" class="form-control" id="txtCodeCount" name="txtCodeCount" placeholder="Between 1-50">
                            </div>

                            <div class="form-group col-md-4">
                                <input id="chkActive" name="chkActive" checked="checked" required="required" type="checkbox" value="" />
                                <label for="chkActive">Set generated code to active</label>
                            </div>

                        </div>

                        <div class="text-center">
                            <button type="submit" id="btnSubmit" class="btn btn-lg btn-primary mb-4">Generate New Code</button>
                            <p class="form-footer-text">Switch to the active QR Code tab to view active QR codes.</p>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Mapped QR code text are QR code text that has been mapped to any customer.
                        </p>
                        <table class="table table-striped table-bordered"  style="width:100%; font-size: .8rem;" id="mappedQrcodeTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Number</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Code Text</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Is Mapped</th>
                                </tr>
                            </thead>
                            <tbody id="mappedtbody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Un-mapped QR code text are QR code text that has not been mapped to any customer. Mapping can be done directly from within 
                            this tab or from the customer profile page.
                        </p>
                        <table class="table table-striped table-bordered"  style="width:100%; font-size: .8rem;" id="qrcodeTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Number</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Code Text</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Is Mapped</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <p class="feature-title">
                            You can print QR Codes from exisiting un-mapped QR Code texts
                        </p>
                    </div>
                </div>
            </div>

        </form>
    </section>
</asp:Content>

<asp:Content runat="server" ID="scriptConten" ContentPlaceHolderID="scriptContentPlaceHolder">
    <script type="text/javascript">
        var pageSize = 10;

        function getUnMappedQRCodeText(active, mapped) {

            var data = {
                active: active,
                mapped : mapped
            };

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetMappedQrCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    /*console.log(responseData);*/
                    var status = responseData.Status;
                    if (status >= '1') {

                        var tbody = $('#tbody');
                        var $tr = $('<tr>');

                        $.each(responseData.qr_codes, function (i, row) {
                            let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td class='batchnumber'>${row.batch_number}</td> 
                                            <td class='batchname'>${row.batch_name}</td>
                                            <td>${row.code}</td>
                                            
                                            <td class='status'>${(row.active == '1') ? 'Active' : 'In-active'}</td>
                                            <td class='mapped'>${row.created_at}</td>
                                            <td>${(row.date_used == undefined) ? 'No' : 'Yes'}</td>
                                        </tr>`;

                            $('#tbody').append(rows);
                        });

                        $('#qrcodeTable').DataTable();

                        $("#divAlert").addClass("alert alert-success alert-dismissible fade show").show().slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);

                    }
                    else if (status == '0') {

                        $("#lblErrorText").html(responseData.Message);

                    }
                },
                error: function (data) {
                    /*$("#divAlert").addClass("alert alert-danger alert-dismissible fade show").slideDown("slow");*/
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });

        }

        function getMappedQRCodeText(active, mapped) {

            var data = {
                active: active,
                mapped: mapped
            };

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetMappedQrCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    /*console.log(responseData);*/
                    var status = responseData.Status;
                    if (status >= '1') {

                        var tbody = $('#tbody');
                        var $tr = $('<tr>');

                        $.each(responseData.qr_codes, function (i, row) {
                            let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td class='batchnumber'>${row.batch_number}</td> 
                                            <td class='batchname'>${row.batch_name}</td>
                                            <td>${row.code}</td>
                                            
                                            <td class='status'>${(row.active == '1') ? 'Active' : 'In-active'}</td>
                                            <td class='mapped'>${row.created_at}</td>
                                            <td>${(row.date_used == undefined) ? 'No' : 'Yes'}</td>
                                        </tr>`;

                            $('#mappedtbody').append(rows);
                        });

                        $('#mappedQrcodeTable').DataTable();

                        $("#divAlert").addClass("alert alert-success alert-dismissible fade show").show().slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);

                    }
                    else if (status == '0') {

                        $("#lblErrorText").html(responseData.Message);

                    }
                },
                error: function (data) {
                    /*$("#divAlert").addClass("alert alert-danger alert-dismissible fade show").slideDown("slow");*/
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });

        }

        function getBatchName() {
            
            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/DistinctBatchNameNumber",
                dataType: "json",
                contentType: "application/json",
                success: function (res) {
                    $.each(res.d, function (i, data) {

                        $("#cmbBatchNumber").append($("<option></option>").val(data.id).html(data.batch_number));
                        $("#cmbBatchName").append($("<option></option>").val(data.id).html(data.batch_name));
                    })
                }

            });

        }

        $(document).ready(function () {

            $("#divAlert").hide();
            $('#cmbBatchName').css('display', 'none');
            $('#cmbBatchNumber').css('display', 'none');

            //$('#cmbBatchName').select2();
            //$('#cmbBatchNumber').select2();

            $(".batch-edit").on('click', function () {

                //var propt = prompt('Are you sure you want to edit the batch - type yes to proceed');
                //if (propt == 'Yes' || propt == 'yes') {

                    //$('#txtBatchNumber').prop('readonly', false).val(' ').focus();

                    $('#txtBatchName').css('display', 'none');
                    $('#txtBatchNumber').css('display', 'none');

                    $('#cmbBatchName').css('display', 'block');
                    $('#cmbBatchNumber').css('display', 'block');


                    getBatchName();
                //}

            });

            console.log("Jquery is ready to shoot!!");

            //Set new batch number
            $("#txtBatchNumber").val("BTCH - " + Math.floor(Math.random() * 1000000) + 1);

            //Fetch active records fromt the database
            getUnMappedQRCodeText(1, 0);

            getMappedQRCodeText(1, 1);

            //validate form
            //$("#frmQrcode").validate();
            $("#btnSubmit").on('click', function (e) {

                e.preventDefault();

                var _bnumber = $('#txtBatchNumber').val();
                var _bname = $('#txtBatchName').val();
                var _codecount = $('#txtCodeCount').val();
                var _active = $('#chkActive').prop('checked');

                if (_bnumber.length < 1) {
                    $("#lblErrorText").html("Batch number is required");
                    return;
                }

                if (_bname.length < 1) {
                    $("#lblErrorText").html("Batch name is required");
                    return;
                }

                if (_codecount.length < 1 || _codecount == '0') {
                    $("#lblErrorText").html("Total number of generated code is required or should be greater than zero");
                    return;
                }

                var qrcode = {

                    batch_number: $("#txtBatchNumber").val(),
                    batch_name: $("#txtBatchName").val(),
                    code_count: $("#txtCodeCount").val(),
                    active: ($("#chkActive").prop('checked')) ? 1 : 0
                };

                var data = {
                    qrcode: qrcode
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/qrcode.asmx/SaveNewQrCode",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    cache: false,
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //Refresh the table
                            getMappedQRCodeText();

                            $("#divAlert").addClass("alert alert-success alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                        }
                        else if (status == '0') {

                            $("#lblErrorText").html(responseData.Message);

                        }
                    },
                    error: function (data) {
                        /*$("#divAlert").addClass("alert alert-danger alert-dismissible fade show").slideDown("slow");*/
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });

                //if ($("#frmQrcode").valid()) {

                   
                //} else {
                //    $("#divAlert").show().addClass("alert alert-warning alert-dismissible fade show").attr('display', false).slideDown("slow");
                //    $("#lblErrorText").html("Oops!!! Please fill out the required fields on the form to proceed");
                //    return;
                //}
            });

            $("#btnSearcBatchName").on('click', function () {

                alert('weclome');

            });
        });

    </script>
</asp:Content>
