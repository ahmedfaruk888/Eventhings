<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="codelink.aspx.cs" Inherits="Eventhings.clients.auth.codelink" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">

</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
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
                <h6 class="widget-title">QR Code Text</h6>
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
        <form action="codelink.aspx" method="POST" id="frmQrcode" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Map Code Text - Customer
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            Un-Map Code Text - Customer</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Transaction History
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            E-Wallet
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Map a new QR Code to a new customer</p>
                            </section>
                            <div class="text-center">
                                <canvas id="customerQR"></canvas>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text" id="infotext"></p>
                                <span id="codeStatus"></span>
                            </div>

                            <div class="form-group col-md-3" id="insert-batch-name">
                                <label for="txtBatchName">Customer - Phone <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtCustomerPhone" name="txtCustomerPhone" placeholder="+2348144488577">
                            </div>

                            <div class="form-group col-md-3" id="insert-batch-number">
                                <label for="txtCustomerFullName"> Customer Fullname <sup>*</sup></label>
                                <a href="#" class="batch-edit" onclick="javascript:void(0)"><span class="fa fa-user-edit"></span></a>
                                <input type="text" class="form-control" readonly="readonly" id="txtCustomerFullName" required="required" name="txtCustomerFullName" placeholder="Faruk Ahmed Monkwo">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtBatchName"> Event (Select default - eventi.ng) <sup>*</sup></label>
                                <select class="form-control" id="cmbEvents" name="cmbEvents">
                                    
                                </select>
                            </div>

                            
                            <div class="form-group col-md-3">
                                <label for="txtCodeCount">Wallet - Top-up Amount <sup>*</sup></label>
                                <input type="number" min="1" max="50" class="form-control" id="txtTopUpAmount" name="txtTopUpAmount" placeholder="Between 1000 - nth thousand">
                            </div>

                            <div class="form-group col-md-4">
                                <input id="chkActive" name="chkActive" required="required" type="checkbox" value="" />
                                <label for="chkActive">Disable this user</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSubmit" class="btn btn-lg btn-primary mb-4">Link Code</button>
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
                        <table class="table table-striped"  style="width:100%; max-height: 500px; font-size: .7rem;" id="mappedQrcodeTable">
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

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Un-mapped QR code text are QR code text that has not been mapped to any customer. Mapping can be done directly from within 
                            this tab or from the customer profile page.
                        </p>
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
                                    <th scope="col">Mapped</th>
                                </tr>
                            </thead>
                            <tbody id="unmappedtbody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>Print QR Code Images From Store QR Code Text</p>
                        </section>
                        
                        <div class="row">
                            <div class="form-group col-md-6">
                                <select class="form-control" name="cmbGenBatchNames" id="cmbGenBatchNames" runat="server">
                                    <option value="1">New Bach Test</option>
                                    <option value="2">New Bach Test A</option>
                                    <option value="2">New Bach Test Z</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
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

                        <div class="row" id="divQrCardBody">
                            
                        </div>
                    </div>
                </div>
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
                /*data: JSON.stringify(data),*/
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    $('#cmbEvents').empty();

                    $.each(responseData, function (i, data) {

                        $('#cmbEvents').append($("<option></option>").val(data.id).html(data.name + ' | ' + 'Duratioin = ' + data.duration));

                    });
                },
                beforeSend: function () {
                    $('#cmbEvents').append($("<option>Loading events...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetMappedQrDetails(code) {

            var data = {
                code: code
            }

            $.ajax({
                type: "POST",
                url: "/Services/qrcode.asmx/GetMappedQrCodeByCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    console.log(responseData);
                    $("#lblErrorText").html(responseData.Message);
                    //alert(responseData.Status);
                    /*
                        <span id="codeStatus"></span>
                                    <span id="dateUsed"></span>
                                    <span id="EventName"></span>
                     */
                    console.log(responseData.event_name);
                    $('#codeStatus').html("<b>Code Text Status:</b> " + ((responseData.Status == '1') ? "Mapped." : "Not Mapped") + "<b> Date Mapped:</b> " + responseData.date_mapped + ". <b> Event Name:</b> " + responseData.event_name);

                    //if (responseData.date_mapped != undefined || responseData.date_mapped != null) {

                        

                    //}

                    //$('.infotext').append("Code Status : " + (responseData.Status));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        $(document).ready(function () {

            $('label sup').css('color', 'red');

            if (window.location.search.indexOf('?') == -1) {

                $('#myTabContent0').hide();
                return;
            }

            //? code=cc7aa34a-4743-4cbb-af47-5c9927020862
            //check if the code is null or undefine
            //if null, disable the link code button

            //else check if code is mapped (check the codestore table)
            //if mapped, retireve the user detils
            //else retrieve all customer phone and autocomplete to phone control

            var codeAndValue = window.location.search.split('?')[1].trim();
            var codeValue = codeAndValue.split('=')[1];
            var codeText = codeAndValue.split('=')[0];
            if ((codeText == null || codeText == undefined) || (codeText != 'code')) {

                $('#myTabContent0').hide();
                return;
            }

            //display the qrcode text
            $('#infotext').text(codeValue);

            //Get a list of all available events
            GetEvents();


            //chekc if the qrcode has been apped
            //if mapped display the mapping details
            GetMappedQrDetails(codeValue);

            qr = new QRious({
                element: document.getElementById('customerQR'),
                size: 206,
                value: 'https://localhost:44329/clients/auth/codelink.aspx?code=' + codeValue,
                foreground: 'black'
            });

        });


    </script>
</asp:Content>
