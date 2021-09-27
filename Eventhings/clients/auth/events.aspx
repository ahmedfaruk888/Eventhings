<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="Eventhings.clients.auth.qrcode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
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
                <h6 class="widget-title">Create New Events</h6>
                <p class="widget-content">Geneate new QR Code for an event</p>
            </div>
        </div>
        <div class="contact-widget media">
            <img src="../assets/images/icon-5.png" alt="book" width="40">
            <div class="media-body">
                <h6 class="widget-title">Manage Existing Events</h6>
                <p class="widget-content">Having issues with a customer QR code, deativate it here</p>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="index.html">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab0" data-mdb-toggle="tab" data-mdb-target="#home0" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Create New Event
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab0" data-mdb-toggle="tab" data-mdb-target="#profile0"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            View All Events</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab0" data-mdb-toggle="tab" data-mdb-target="#contact0"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            On-Going Events
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="setting-tab0" data-mdb-toggle="tab" data-mdb-target="#contact0"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Settings 
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="home0" role="tabpanel" aria-labelledby="home-tab0">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px">
                                <h5>Generate New QR Codes</h5>
                            </section>
                            <div class="form-group col-md-6">
                                <label for="name">YOUR NAME <sup>*</sup></label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Name *">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">YOUR EMAIL ADDRESS <sup>*</sup></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="ahmed.farouq@eventhings.com">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="subject">SUBJECT <sup>*</sup></label>
                                <input type="text" class="form-control" id="subject" name="subject" placeholder="Development">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="phone">YOUR PHONE NUMBER <sup>*</sup></label>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="081-444-88577">
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary mb-4">Submit</button>
                            <p class="form-footer-text">We'll get back to you in 1-2 business days.</p>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="profile0" role="tabpanel" aria-labelledby="profile-tab0">
                        Tab 2 content
                    </div>

                    <div class="tab-pane fade" id="contact0" role="tabpanel" aria-labelledby="contact-tab0">
                        Tab 3 content
                    </div>

                    <div class="tab-pane fade" id="settings0" role="tabpanel" aria-labelledby="contact-tab0">
                        Tab 3 content
                    </div>
                </div>
            </div>

        </form>
    </section>
</asp:Content>
