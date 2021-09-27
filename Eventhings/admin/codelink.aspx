<%@ Page Title="" Language="C#" MasterPageFile="~/admin/site.Master" AutoEventWireup="true" CodeBehind="codelink.aspx.cs" Inherits="Eventhings.admin.codelink" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <%--<form action="qrcodegen.aspx" method="post" runat="server" id="frmQrcodeGen" style="padding-top: 80px">--%>
        <div class="content">

                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div>

                <div class="page-content-wrapper ">
                    <div class="container">

                        <div class="row">
                            <div class="form-group col-md-12">
                            <label for="email">Code<sup>*</sup></label>
                            <input type="text" class="form-control" id="txtCode" name="txtCode">
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    <%--</form>--%>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        alert('welcome');

        $(document).ready(function () {

            var params = new URLSearchParams(window.location.search);
            var codeText = 'code';

            if (params.length > 0) {

                var hasCode = (params.has(codeText) == true) ? true : false;

                if (hasCode) {

                    $("#txtCode").val(params.get(codeText));
                    alert(params.get(codeText));
                }
            }

        });
    </script>
</asp:Content>
