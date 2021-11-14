<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="Eventhings.clients.auth.sales" %>


<asp:Content ID="headContentContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    
</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
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
        <form action="sales.aspx" method="POST" id="frmSales" runat="server">
            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-bs-toggle="tab" data-bs-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Sales
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            View Sales History</button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                           <%-- <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <h5>Choose item to add to cart</h5>
                            </section>

                            <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Enter customer phone number">
                            </div>--%>

                            <div class="form-group col-md-12">
                                <label for="cmbCategoryParent">Choose a product</label>
                                <select required="required" class="form-control multiple" id="cmbCategoryParent" name="cmbHost">
                                    
                                </select>
                            </div>

                            <div class="row" id="salesDiv">
                                <div class="col-md-6">
                                    <div class="form-group col-md-12">
                                            <%--<div class="card border border-primary shadow-0 pl-0 pr-0">
                                                <div class="card-body" id="itemBody">
                                                    <h4 id="pItemName"></h4>
                                                    <span id="pItemPoint"></span>
                                                    <span id="pItemPrice"></span>
                                                    <span id="pItemCategory"></span>
                                                    <span id="pItemQuantity"></span>
                                                    <input type="number" min="1" value="1" class="form-control" id="txtQuantity" name="txtQuantity" placeholder="Quantity" />
                                                </div>
                                                <div class="card-footer align-content-end">
                                                    <button type="button" id="btnAddToCart" class="btn form-control-sm btn-outline-danger btn-rounded" data-bs-ripple-color="#000000">Add to cart </button>
                                                </div>
                                            </div>--%>
                                        </div>
                                    <div class="form-group col-md-12">
                                        <div class="card border border-primary shadow-0 pl-2 pr-2">
                                            <%--<div class="bg-image hover-overlay ripple" data-bs-ripple-color="light">
                                                <img src="https://res.cloudinary.com/imtechnetronics/image/upload/v1633383459/eventi/sterling_spyue8.png"
                                                    class="img-fluid" />
                                                <a href="#!">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15)"></div>
                                                </a>
                                            </div>--%>
                                            <div class="card-body">
                                                <p class="card-text" id="itemInfo">
                                                    <%--<b>Direct Bank Deposit</b>
                                                    <br />
                                                    Account: <b>0229819219290</b>
                                                    <br />
                                                    <b>USSD: *737*2*Amount*Account#</b>--%>
                                                </p>
                                                <input type="number" min="1" value="1" class="form-control" id="txtQuantity" name="txtQuantity" placeholder="Quantity" />
                                            </div>
                                            <div class="card-footer align-content-end">
                                                <button type="button" id="btnAddToCart" class="btn btn-outline-primary btn-rounded" data-bs-ripple-color="#000000">Add Item to Cart </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="hnd" />
                                <div class="col-md-6 shadow-0 pl-3 pr-3">
                                    <div class="form-group" id="amountDiv">
                                        <div class="cartColl" style="max-height: 400px; padding: 4px"></div>

                                        <div class="text-center">
                                            <%--<p>Welcome - Olamide Ijaduola</p>--%>
                                            <img src="../assets/images/logo.png" />
                                            <div class="info">
                                                <%--<h5>Contact Info</h5>--%>
                                                <p>
                                                    Address : No 11 Mercurly Adesanya Street, Ikoyi, Lagos State</br>
                                                    Email   : info@eventi.ng | Phone   : +2348144488577</br>
                                                </p>
                                                <h3 id="lblFullName"></h3>
                                                <table class="table table-striped" id="invoiceTable">
                                                    <thead>
                                                        <tr>
                                                            <th>SN</th>
                                                            <th>Item</th>
                                                            <%--<th>Desc.</th>--%>
                                                            <th>Point</th>
                                                            <th>Price</th>
                                                            <th>Qty.</th>
                                                            <th>Total</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="invoiceBody">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td>
                                                                <h5>Total = </h5>
                                                            </td>
                                                            <td><span class="grandTotal" id="spGrandTotal"/></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div id="legalcopy">
                                                    <p class="legal"><strong>Thank you for your business!</strong>  Payment is expected within 31 days; please process this invoice within that time. There will be a 5% interest charge per month on late invoices. </p>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="text-center">
                                            <button type="button" id="btnSaveSales" class="btn btn-lg btn-primary mb-4">Confirm Payment & Checkout</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
                            <div style="max-height: 300px; overflow-y: scroll">
                                <table class="table table-striped table-bordered" style="width: 100%; " id="walletTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </th>
                                            <th scope="col">S/N</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Point</th>
                                            <th scope="col">Payment Channel</th>
                                            <th scope="col">Preious Balance</th>
                                            <th scope="col">Amount Paid</th>
                                            <th scope="col">Current Balance</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Top-Up By</th>
                                            <th scope="col">Top-Up Date</th>
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
                </div>
            </div>
        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var payment_channel = '';
        var user_id = '';

        function GetItemPoint4Sales() {
            $.ajax({
                type: "POST",
                url: "/Services/items.asmx/GetItemPoint4Sales",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                /*data: JSON.stringify(data),*/
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#itemDiv').empty();
                    $.each(responseData, function (i, row) {

                        $('#itemDiv').append(item);
                    });
                },
                beforeSend: function () {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', true).slideDown("slow");
                    $('#lblErrorText').append("Loading items...");
                },
                complete: function () {
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideUp("slow");
                    $('#lblErrorText').append("");
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });

        }

        function GetItems() {

            $.ajax({
                type: "POST",
                url: "/Services/items.asmx/GetProductWithPoint",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    $('#cmbCategoryParent').empty();
                    $('#cmbCategoryParent').append($("<option></option>").val(0).html("-- Please choose a mapped item --"));
                    $.each(responseData, function (i, data) {

                        $('#cmbCategoryParent').append($("<option></option>").val(data.id).html(data.item_name));

                    });
                },
                beforeSend: function () {
                    $('#cmbCategoryParent').append($("<option>Loading product items...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
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
                        $('#lblFullName').text(responseData.last_name + " " + responseData.first_name + "   - Point - " + sessionStorage.getItem('point'));
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

        $(document).ready(function () {

            $("#txtQuantity").keypress(function (e) {
                if (String.fromCharCode(e.keyCode).match(/[^1-9]/g)) return false;
            });

            GetItems();
            GetCustomer(window.location.search.split('=')[1]);

            $('#txtQuantity').val('1');

            $('label sup').css('color', 'red');
            //$('#salesDiv').css('display', 'none');
            $('#amountDiv').hide();
            $('#divAlert').hide();

            //Search by phone 
            var _point = '';
            var _amount = '';
            var _name = '';

            $('#txtQuantity').on('keypress', function (e) {

                if ($(this).val() < 1) {
                    
                    $('#lblResult').text(1 * parseInt(_point.split(':')[1].trim()));
                    

                } else {
                    $('#lblResult').text(parseInt($(this).val()) * parseInt(_point.split(':')[1].trim()));
                }

            });

            $("#cmbCategoryParent").on('change', function (e) {

                var productid = $("#cmbCategoryParent option:selected").val();
                var productname = $("#cmbCategoryParent option:selected").text();
                $('#salesDiv').show();

                $.ajax({
                    type: "POST",
                    url: "/Services/items.asmx/GetItemPoint4Sales",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ "itemid": productid }),
                    cache: false,
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        sessionStorage.setItem('product', JSON.stringify(responseData));
                        $("#itemInfo").html("<h4>" + responseData.item_name + "</h4> </br> <b>Point: </b>" + responseData.mapped_point + "</br><b>Price: </b>" + responseData.point_price + "</br><b>Category: </b>" + responseData.category_name + "</br><b>Qty.: </b>" + responseData.item_quantity);
                    },
                    beforeSend: function () {
                        //$('#cmbCategoryParent').append($("<option>Loading product items...</option>"));
                    },
                    complete: function () {

                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });                
            });

            var seesion = "";
            $('#btnAddToCart').on('click', function (e) {
                var grandTotalT = 0;
                $('#amountDiv').show();
                var product = JSON.parse(sessionStorage.getItem('product'));
                var grandTotal = parseInt(($('.grandTotal').text() == '') ? 0 : $('.grandTotal').text());
                $(".invoiceBody").prepend
                    (`
                        <tr><td>${product.point_id}</td><td>${product.item_name}</td> <td>${product.mapped_point}</td> <td>${product.point_price}</td> <td>${$("#txtQuantity").val()}</td> <td>${(product.mapped_point * $('#txtQuantity').val())}</td> <td><a href='#'><span class='fas fa-times-circle'> </span></a> </td></tr>`
                    );

                $(".invoiceBody tr").each(function (i, data) {
                    var row = i+1;
                    var col = 6;
                    var cell = $('#invoiceTable tr:nth-child(' + row + ') td:nth-child(' + col + ')').text();
                    grandTotalT = parseInt(cell) + parseInt(grandTotalT);
                    $('#spGrandTotal').text(grandTotalT);
                });

                var hnd = $('#hnd').val();
                //if(htn.le)
                    

                e.preventDefault();
            });

            $("#btnSaveSales").on('click', function (e) {

                var TableData = [];
                var objArr = new Array();
                var thepayment = new Array();

                $('#invoiceTable').find('tr:has(td)').each(function (i, resp) {
                    var obj = new Object;

                    console.log($(this).find('td').eq(1)[0].innerHTML);

                    //obj.point_id = $(this).find('td').eq(1)[0].innerHTML;
                    //obj.item_name = $(this).find('td').eq(2)[0].innerHTML;
                    //obj.mapped_point = $(this).find('td').eq(3)[0].innerHTML;
                    //obj.point_price = $(this).find('td').eq(4)[0].innerHTML;

                    //thepayment.push(obj.point_price);
                    //alert(obj);
                });

                // This does:
                var DTO = { 'sales': thepayment };
                alert(DTO);
                //var data = {
                //    sales: objArr
                //}
                
                //make ajax call
                $.ajax({
                    type: "POST",
                    url: "/Services/sales.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(DTO),
                    cache: false,
                    success: function (response) {
                        
                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        //alert(responseData.d);

                        //$('#itemDiv').empty();
                        //$.each(responseData, function (i, row) {

                        //    $('#itemDiv').append(item);
                        //});
                    },
                    beforeSend: function () {
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', true).slideDown("slow");
                        $('#lblErrorText').append("Loading items...");
                    },
                    complete: function () {
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideUp("slow");
                        $('#lblErrorText').append("");
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });

                //alert(data);
                //alert(data2);
                e.preventDefault();
            });
        });
    </script>
</asp:Content>
