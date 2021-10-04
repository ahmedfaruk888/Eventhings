<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="Eventhings.clients.auth.item" %>


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
        <form action="account.aspx" method="POST" id="frmItem" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newcategory-tab" data-mdb-toggle="tab" data-mdb-target="#newcategorycontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Product Category
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="newqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Product Unit - Measurement
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            New Product Entry
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Product Points Mapping
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Manage Product
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newcategorycontent" role="tabpanel" aria-labelledby="newcategory-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p class="card-title">Category Setup</p>
                            </section>

                            <div class="form-group col-md-8">
                                <label for="txtCategoryName">Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtCategoryName" required="required" name="txtCategoryName" placeholder="Drinks">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="cmbCategoryParent">Category Parent</label>
                                <select required="required" class="form-control" id="cmbCategoryParent" name="cmbHost">
                                    
                                </select>
                            </div>
                            
                            <div class="form-group col-md-12">
                                <label for="txtCategoryDescription"> Description <sup>*</sup></label>
                                <input type="tel" class="form-control" id="txtCategoryDescription" name="txtCategoryDescription" placeholder="A carbonated drinks">
                            </div>

                             <div class="form-group col-md-3">
                                <input id="chkEnableCategory" checked="checked" name="chkEnableCategory" type="checkbox" value="" />
                                <label for="chkEnableCategory"> &nbsp; Enable this category by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveCategory" class="btn btn-lg btn-primary mb-4">Create Category</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">Category parent is used to specify the parent of the current category in context</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Product unit of measurement</p>
                            </section>

                            <div class="form-group col-md-12">
                                <label for="txtUnitName">Unit Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtUnitName" required="required" name="txtUnitName" placeholder="Farouq Ahmed">
                            </div>

                             <div class="form-group col-md-3">
                                <input id="chkEnableUnit" checked="checked" name="chkEnableUnit" type="checkbox" value="" />
                                <label for="chkEnableUnit"> &nbsp; Enable this unit by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveUnit" class="btn btn-lg btn-primary mb-4">Create Measurement Unit</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only map a single QR code text to a single user at a time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Add new product
                        </p>
                        <div class="row">
                           <div class="form-group col-md-8">
                                <label for="txtProductName">Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtProductName" required="required" name="txtProductName" placeholder="Eva bottle water">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtProductDescription">Description </label>
                                <input type="text" class="form-control" id="txtProductDescription" required="required" name="txtProductDescription" placeholder="Eva distilled bottle water">
                            </div>
                            
                            <div class="form-group col-md-8">
                                <label for="txtProductCost"> Cost <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtProductCost" required="required" name="txtProductCost" placeholder="150:00">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtProductPrice"> Price <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtProductPrice" required="required" name="txtProductPrice" placeholder="125:00">
                            </div>

                            <div class="form-group col-md-8">
                                <label for="cmbProductCategory">Category <sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbProductCategory" name="cmbProductCategory">
                                    
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtProductQuantity"> Quantity <sup>*</sup></label>
                                <input type="number" min="1" class="form-control" id="txtProductQuantity" required="required" name="txtProductQuantity" placeholder="1">
                            </div>

                             <div class="form-group col-md-3">
                                <input id="chkEnableProduct" checked="checked" name="chkEnableProduct" type="checkbox" value="" />
                                <label for="chkEnableProduct"> &nbsp; Enable this product by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveProduct" class="btn btn-lg btn-primary mb-4">Create Product</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Product mapping
                        </p>
                        
                        <div class="row">
                           <div class="form-group col-md-8">
                                <label for="cmbMapCategory">Product <sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbMapCategory" name="cmbMapCategory">
                                    
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="cmbMapMeasurement">Product Measurement<sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbMapMeasurement" name="cmbMapMeasurement">
                                    
                                </select>
                            </div>

                            <div class="form-group col-md-8">
                                <label for="txtProductCost"> Cost <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtMapCost" required="required" name="txtMapCost" placeholder="150:00">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtMapPrice"> Price <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtMapPrice" required="required" name="txtMapPrice" placeholder="125:00">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="txtMapPoints"> Point <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtMapPoints" required="required" name="txtMapPoints" placeholder="1">
                            </div>

                            <div class="form-group col-md-3">
                                <input id="chkEnableMap" checked="checked" name="chkEnableMap" type="checkbox" value="" />
                                <label for="chkEnableMap"> &nbsp; Enable this maping by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveMapping" class="btn btn-lg btn-primary mb-4">Map Product</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>Manage Product</p>
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
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Cost</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
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

        function GetParentCategory() {

            $.ajax({
                type: "POST",
                url: "/Services/category.asmx/GetCategory",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbCategoryParent').empty();
                    $('#cmbCategoryParent').append($("<option></option>").val('0').html('Parent Category'))
                    $.each(responseData, function (i, data) {

                        if (data.parent === 0) {
                            $('#cmbCategoryParent').append($("<option></option>").val(data.id).html(data.name));
                        }

                    });
                },
                beforeSend: function () {
                    $('#cmbCategoryParent').append($("<option>Loading categories...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetCategory() {

            $.ajax({
                type: "POST",
                url: "/Services/category.asmx/GetCategory",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbProductCategory').empty();
                    $('#cmbMapCategory').empty();

                    //$('#cmbProductCategory').append($("<option></option>").val('0').html('Parent Category'))
                    $.each(responseData, function (i, data) {
                        
                        $('#cmbProductCategory').append($("<option></option>").val(data.id).html(data.name));
                        $('#cmbMapCategory').append($("<option></option>").val(data.id).html(data.name));

                    });
                },
                beforeSend: function () {
                    $('#cmbProductCategory').append($("<option>Loading categories...</option>"));
                    $('#cmbMapCategory').append($("<option>Loading categories...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetUnit() {

            $.ajax({
                type: "POST",
                url: "/Services/unit.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbMapMeasurement').empty();
                    $.each(responseData, function (i, data) {

                        $('#cmbMapMeasurement').append($("<option></option>").val(data.id).html(data.name));

                    });
                },
                beforeSend: function () {
                    $('#cmbMapMeasurement').append($("<option>Loading unit...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        $(document).ready(function () {

            $('label sup').css('color', 'red');

            GetParentCategory();
            GetCategory();
            GetUnit();

            //Save new role information
            $("#btnSaveCategory").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtCategoryName").val();
                var categoryParent = $("#cmbCategoryParent option:selected").val();
                var description = $("#txtCategoryDescription").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Product category name is required"); return;
                }
                if (categoryParent == '' || categoryParent.length < 1) {
                    $("#lblErrorText").html("Product category parent is required"); return;
                }
                if (description == '' || description.length < 1) {
                    $("#lblErrorText").html("Product category description is required"); return;
                }

                var catdto = {

                    name: name,
                    parent: categoryParent,
                    description: description,                    
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableCategory').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    catdto: catdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/category.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();

                            GetParentCategory();
                            GetCategory();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveCategory").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveCategory").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        //$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveUnit").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtUnitName").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Category unit name is required"); return;
                }

                var unitto = {

                    name: name,
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableUnit').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    unitto: unitto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/unit.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //$("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();
                        }
                        else if (status == '0') {
                            /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");*/
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveUnit").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveUnit").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        //$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveProduct").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtProductName").val();
                var description = $("#txtProductDescription").val();
                var cost = $("#txtProductCost").val();
                var price = $("#txtProductPrice").val();
                var category = $("#cmbProductCategory option:selected").text();
                var quantity = $("#txtProductQuantity").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Product name is required"); return;
                }
                if (cost == '' || cost.length < 1) {
                    $("#lblErrorText").html("Product cost parent is required"); return;
                }
                if (price == '' || price.length < 1) {
                    $("#lblErrorText").html("Product price is required"); return;
                }
                if (category == '' || category.length < 1) {
                    $("#lblErrorText").html("Product category is required"); return;
                }
                if (quantity == '' || quantity.length < 1) {
                    $("#lblErrorText").html("Product quantity is required"); return;
                }
                if (quantity < 1) {
                    $("#lblErrorText").html("Product quantity must be greater than zero"); return;
                }
                if (cost < 1) {
                    $("#lblErrorText").html("Product cost must be greater than zero"); return;
                }
                if (price < 1) {
                    $("#lblErrorText").html("Product price must be greater than zero"); return;
                }

                var productdto = {

                    name: name,
                    description: description,
                    cost: cost,
                    price: price,
                    category: category,
                    quantity: quantity,

                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableProduct').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    productdto: productdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/products.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //$("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveProduct").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveProduct").attr('disabled', false);
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveMapping").on('click', function (e) {

                e.preventDefault();

                var itemtext = $("#cmbMapCategory option:selected").text();
                var unitid = $("#cmbMapMeasurement option:selected").val();
                var cost = $("#txtMapCost").val();
                var price = $("#txtMapPrice").val();
                var point = $("#txtMapPoints").val();

                if (itemtext == '' || itemtext.length < 1) {
                    $("#lblErrorText").html("Product name is required"); return;
                }
                if (unitid == '' || unitid.length < 1) {
                    $("#lblErrorText").html("Product unit measurement is required"); return;
                }
                if (cost == '' || cost.length < 1) {
                    $("#lblErrorText").html("Product mapping cost is required"); return;
                }
                if (price == '' || price.length < 1) {
                    $("#lblErrorText").html("Product mapping price is required"); return;
                }
                if (point == '' || point.length < 1) {
                    $("#lblErrorText").html("Product mapping point is required"); return;
                }

                if (point < 1) {
                    $("#lblErrorText").html("Product mapping point must be greater than zero");
                    return;
                }
                if (cost < 1) {
                    $("#lblErrorText").html("Product mapping cost must be greater than zero"); return;
                }
                if (price < 1) {
                    $("#lblErrorText").html("Product mapping price must be greater than zero"); return;
                }

                var mapdto = {

                    item_id: itemtext,
                    unit_id: unitid,
                    cost: cost,
                    price: price,
                    point: point,

                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableMap').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    mapdto: mapdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/mapping.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //$("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveMapping").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveMapping").attr('disabled', false);
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });
        });
    </script>
</asp:Content>
