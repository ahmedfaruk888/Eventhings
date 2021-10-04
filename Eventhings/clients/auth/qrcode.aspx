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
    <%--<section class="contact-content">
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
    </section>--%>
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
                                <input type="text" class="form-control" readonly="readonly" id="txtBatchNumber" required="required" name="txtBatchNumber" />
                                <select class="form-control" id="cmbBatchNumber" name="cmbBatchNumber">

                                    <%--<option value="value">--Please choose one--</option>
                                    <option value="value">--Please choose one--</option>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-4" id="insert-batch-name">
                                <label for="txtBatchName">Batch Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtBatchName" name="txtBatchName" placeholder="Evening batch">
                            </div>
                            
                            <div class="form-group col-md-4">
                                <label for="txtCodeCount">Generated Code Count <sup>*</sup></label>
                                <input type="number" min="1" max="50" class="form-control" id="txtCodeCount" name="txtCodeCount" placeholder="Between 1-50">
                            </div>

                            <div class="form-group col-md-4">
                                <input id="chkActive" name="chkActive" checked="checked" required="required" type="checkbox" value="" />
                                <label for="chkActive">Set generated code to active</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSubmit" class="btn btn-lg btn-primary mb-4">Generate New Code</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text">Switch to the active QR Code tab to view active QR codes.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Mapped QR code text are QR code text that has been mapped to any customer.
                        </p>
                        <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Search... by phone or email">
                            </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped"  style="width:100%;" font-size: .7rem;" id="mappedQrcodeTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Code Text</th>
                                    <th scope="col">Date Mapped</th>
                                    <th scope="col">Event</th>
                                    <%--<th scope="col">Date</th>
                                    <th scope="col">Mapped</th>--%>
                                </tr>
                            </thead>
                            <tbody id="mappedtbody">
                                
                            </tbody>
                        </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Un-mapped QR code text are QR code text that has not been mapped to any customer. Mapping can be done directly from within 
                            this tab or from the customer profile page.
                        </p>
                         <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Search... by phone or email">
                            </div>
                        <div style="max-height: 300px; overflow-y:scroll;">
                            <table class="table table-striped table-bordered"  style="width:100%; font-size: .7rem;" id="unmappedTable">
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
                                    <th scope="col">Active</th>
                                    <th scope="col">Created Date</th>
                                    <th scope="col">Mapped Status</th>
                                </tr>
                            </thead>
                            <tbody id="unmappedtbody">
                                
                            </tbody>
                        </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>Print QR Code Images From Store QR Code Text</p>
                        </section>
                        
                        <div class="row">
                            <div class="form-group col-md-9">
                                <select class="form-control" name="cmbGenBatchNames" id="cmbGenBatchNames" runat="server">
                                   
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-mdb-toggle="dropdown"
                                    aria-expanded="false"> Choose an action
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <a class="dropdown-item" id="btnGenerateQrCodeImages" href="#">Generate QR Code Image</a>
                                    </li>
                                    <li><a class="dropdown-item" id="btnPrintSection" href="print.aspx">Print</a></li>
                                    <li><a class="dropdown-item" href="#">Extras</a></li>
                                </ul>
                            </div>
                            </div>
                        </div>

                        <div class="row" id="divQrCardBody" style="max-height:400px; overflow-y:scroll">
                            
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </section>
</asp:Content>

<asp:Content runat="server" ID="scriptConten" ContentPlaceHolderID="scriptContentPlaceHolder">
    <script type="text/javascript">
        var pageSize = 10;

        function getUnMappedQRCodeText() {

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetUnMappedQrCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    console.log(responseData[0].Status);
                    var status = responseData.Status;
                    if (responseData[0].Status >= '1') {

                        $('#unmappedtbody').empty();

                        $.each(responseData, function (i, row) {
                            let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.batch_number}</td> 
                                            <td>${row.batch_name}</td>
                                            <td>${row.code}</td>
                                            
                                            <td>${(row.active == '1') ? 'Active' : 'In-active'}</td>
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td >
                                            <td>${(row.date_used == undefined) ? 'Not Mapped' : 'Mapped'}</td>
                                        </tr>`;

                            $('#unmappedtbody').append(rows);
                        });

                        //$('#unmappedTable').DataTable();

                        //$("#divAlert").addClass("alert alert-success alert-dismissible fade show").show().slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);

                    }
                    else if (status == '0') {

                        $("#lblErrorText").html(responseData.Message);

                    }
                },
                error: function (data) {
                    /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").slideDown("slow");*/
                    $("#lblErrorText").html("Error occured while fetching data - Un-mapped code");
                }
            });

        }

        function getMappedQRCodeText() {

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetMappedQrCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    /*console.log(responseData);*/
                    var status = responseData[0].Status;
                    if (status >= '1') {

                        $('#mappedtbody').empty();

                        $.each(responseData, function (i, row) {
                            let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.user_id}</td>
                                            <td>${row.code_id}</td>
                                            <td>${(row.date_mapped != undefined) ? $.formattedDate(row.date_mapped) : " - "}</td>
                                            <td>${row.event_id}</td>
                                        </tr>`;

                            $('#mappedtbody').append(rows);
                        });

                        //$('#mappedQrcodeTable').DataTable();

                        $("#divAlert").addClass("alert alert-success alert-dismissible fade show").show().slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);

                    }
                    else if (status == '0') {

                        $("#lblErrorText").html(responseData.Message);

                    }
                },
                error: function (data) {
                    /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").slideDown("slow");*/
                    $("#lblErrorText").html("Error occured while fetching data - mapped codes");
                }
            });

        }

        function getBatchName() {

            $("#cmbBatchNumber").empty();
            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/DistinctBatchNameNumber",
                dataType: "json",
                contentType: "application/json",
                cache: false,
                success: function (res) {
                    $.each(res.d, function (i, data) {

                        $("#cmbBatchNumber").append($("<option></option>").val(data.id).html(data.batch_number + ' | ' + data.batch_name));
                        //$("#cmbBatchName").append($("<option></option>").val(data.id).html(data.batch_name));

                        $("#cmbGenBatchNames").append($("<option></option>").val(data.id).html(data.batch_name));
                    })
                }
            });

            var code = {};
            $("select[id='cmbBatchNumber'] > option").each(function () {
                if (code[this.text]) {
                    $(this).remove();
                } else {
                    code[this.text] = this.value;
                }
            });

            //var usedNames = {};
            //$("#cmbGenBatchNames options").each(function () {
            //    if (usedNames[this.html()]) {
            //        $(this).remove();
            //    } else {
            //        usedNames[this.html()] = this.text;
            //    }
            //});

        }

        $(document).ready(function () {

            //Fetch active records from the database
            getUnMappedQRCodeText();
            getMappedQRCodeText();
            getBatchName();

            //$('#divAlert').css('display', 'none');

            $('#cmbBatchName').css('display', 'none');
            $('#cmbBatchNumber').css('display', 'none');

            //Edit existing QR Code batch and code
            $(".batch-edit").on('click', function () {

                if ($(".batch-edit span").hasClass('fa fa-edit')) {

                    $('#txtBatchNumber').css('display', 'none');
                    $('#txtBatchName').attr('readonly', true);

                    //$('#cmbBatchName').css('display', 'block');
                    $('#cmbBatchNumber').css('display', 'block');

                    $(".batch-edit span").removeClass('fa fa-edit').addClass('fa fa-directions');

                    getBatchName();

                } else if ($(".batch-edit span").hasClass('fa fa-directions')) {

                    $('#txtBatchNumber').css('display', 'block');
                    $('#txtBatchName').attr('readonly', false);

                    //$('#cmbBatchName').css('display', 'block');
                    $('#cmbBatchNumber').css('display', 'none');

                    $(".batch-edit span").removeClass('fa fa-directions').addClass('fa fa-edit');

                } else { return; }

            });

            //Get QR Code bact name from number
            $('#cmbBatchNumber').on('change', function () {

                $('#txtBatchName').val($("#cmbBatchNumber option:selected").text().split('|')[1].trim());

            })

            console.log("Jquery is ready to shoot!!");

            //Set new batch number
            $("#txtBatchNumber").val("BTCH - " + Math.floor(Math.random() * 1000000) + 1);

            //validate form
            //$("#frmQrcode").validate();
            $("#btnSubmit").on('click', function (e) {

                //alert('clicked');
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
                    batch_number: ($("#cmbBatchNumber").css('display') == 'none') ? $("#txtBatchNumber").val() : $("#cmbBatchNumber option:selected").text().split('|')[0].trim(),
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

                        $("#lblErrorText").html(responseData.Message);
                        //$("#frmQrcode").val(0); $("#txtBatchName").val();
                        document.getElementById('frmQrcode').reset();
                        $("#txtBatchNumber").val("BTCH - " + Math.floor(Math.random() * 1000000) + 1);


                        //Generate the QR Code images

                        //Fetch active records from the database
                        getUnMappedQRCodeText();
                    },
                    error: function (data) {
                        /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").slideDown("slow");*/
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnGenerateQrCodeImages").on('click', function (e) {

                e.preventDefault();

                $('#divQrCardBody').empty();

                var data = {

                    batchname: $("#cmbGenBatchNames option:selected").text()
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/qrcode.asmx/GenerteQRCodeImage",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    cache: false,
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        /*var status = responseData.length;*/
                        
                        if (responseData.length > 0) {
                            console.log('lenght = ' + responseData.length);
                            $.each(responseData, function (i, row) {
                                let rows = $("<div class='card border border-primary shadow-0 col-md-2'>" +
                                    "<div class='card - body'><canvas id='" + row.id + '|' + row.code + "'></canvas></div><div class='card - footer'></div></div>");

                                $('#divQrCardBody').append(rows);
                            });

                            var can = document.getElementsByTagName('canvas');

                            var idx = '';
                            var splitid = '';

                            for (x = 0; x <= can.length; x++) {

                                idx = can[x].id;
                                splitid = idx.split('|')[1];

                                qr = new QRious({
                                    element: can[x],
                                    size: 106,
                                    value: 'https://localhost:44329/clients/auth/codelink.aspx?code=' + splitid,
                                    foreground: 'black'
                                });
                            }

                        }

                        $("#lblErrorText").html(responseData.Message);
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });

            });

            $("#btnPrintSection").on('click', function () {
                //alert('printing...');

                /*printdiv('divQrCardBody');*/
                alert($('#divQrCardBody').html());
                sessionStorage.setItem('cc', $('#divQrCardBody').html());

            });
        });

        function printdiv(printdivname) {
            var headstr = "<html><head><title>Booking Details</title></head><body>";
            var footstr = "</body>";
            var newstr = document.getElementById(printdivname).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }

        function printContent(el) {
            var restorepage = $('body').html();
            var printcontent = $('#' + el).clone();
            $('body').empty().html(printcontent);
            window.print();
            $('body').html(restorepage);
        }
    </script>
</asp:Content>
