<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PropertyNew.Master" CodeBehind="Register.aspx.cs" Inherits="Property.Register" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="middle_sect">
        <div class="container">
            <div class="row no_pddng">
                <div class="about_sect_bg">
                      <div class="col-md-3 col-sm-3"></div>
                    <div class="col-md-6 col-sm-6">
                        <div class="contact_form">
                            <form id="contact" action="" method="post">
                                <h3>Register Now</h3>
                                <h4>Resgister yourself today, and get reply with in 24 hours!</h4>
                                <fieldset>
                                    <input placeholder="First Name" type="text" id="firstname" tabindex="1" autofocus>
                                </fieldset>
                                <fieldset>
                                    <input placeholder="Last Name" type="text" id="lastname" tabindex="2">
                                </fieldset>
                                <fieldset>
                                    <input placeholder="Email" type="email" id="userEmail" tabindex="3">
                                </fieldset>
                                <fieldset>
                                    <input placeholder="123-123-1234" type="tel" id="userPhone" tabindex="4">
                                </fieldset>
                             
                                <fieldset>
                                    <textarea placeholder="Type your Message Here...." id="message" tabindex="5"></textarea>
                                </fieldset>
                                <fieldset>
                                    <button name="submit" type="button" id="register" onclick="send()" data-submit="...Sending">Submit</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3"></div>
                </div>
            </div>
        </div>
    </div>

       <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-body table-responsive">
                                            <div class="col-md-12 col-sm-12">
                                                <div style="float: left; width: 100%">
                                                    <h2>Thank you for your interest</h2><br />
                                                    <h4>We will provide you the best possible information.</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer cls_footr">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
<script>
    function getUrlVars() {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }
    function send() {
        if (valid_firstname() && valid_lastname() && ValidEmail() && ValidPhone() && Validmessage()) {
            debugger;
            var Type = getUrlVars()["Type"];
            var Id = getUrlVars()["ID"];

          
            data = "{ firstname: '" + $("#firstname").val() + "', lastname: '" + $("#lastname").val() + "', email: '" + $("#userEmail").val() + "', message: '" + $("#message").val() + "', phone: '" + $("#userPhone").val() + "', Id: '" + Id + "', Type: '" + Type + "'}";
           
            $.ajax({
                type: "POST",
                url: '/registrationfile.asmx/register',
                data: data,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $("#myModal").modal();

                    $("#firstname").val("");
                    $("#lastname").val("");
                    $("#userPhone").val("");
                    $("#message").val("");
                    $("#userEmail").val("");
                },
                error: function (res, status) {
                    if (status === "error") {
                        // errorMessage can be an object with 3 string properties: ExceptionType, Message and StackTrace
                        var errorMessage = $.parseJSON(res.responseText);
                        alert(errorMessage.Message);
                    }
                }
            });
        }
        else {
            return false;
        }
    }
    function valid_firstname() {

        //first name validation
        var firstname = $("#firstname").val();
        if (firstname !== '') {
            if (!/^[a-zA-Z]*$/g.test(firstname)) {
                $("#firstname").addClass('validation_control');
                alert("Invalid user name.");
                return false;
            } else if (firstname.length > 30) {
                $("#firstname").addClass('validation_control');
                alert('firstname cannot exceed more than 30 characters.');
                return false;
            }
            else {
                $("#firstname").removeClass('validation_control');
                return true;
            }
        }
        else {

            $("#firstname").addClass('validation_control');
            alert('must enter username.');
            return false;
        }

        //End

    }
    function valid_lastname() {

        //first name validation
        var lastname = $("#lastname").val();
        if (lastname !== '') {
            if (!/^[a-zA-Z]*$/g.test(lastname)) {
                $("#lastname").addClass('validation_control');
                alert("Invalid last name.");
                return false;
            } else if (lastname.length > 30) {
                $("#lastname").addClass('validation_control');
                alert('last name cannot exceed more than 30 characters.');
                return false;
            }
            else {
                $("#lastname").removeClass('validation_control');
                return true;
            }
        }
        else {

            $("#lastname").addClass('validation_control');
            alert('must enter last.');
            return false;
        }

        //End

    }
    function ValidEmail() {
        //Email validation
        var Email = $("#userEmail").val();
        if (Email !== '') {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (Email.length > 30) {
                alert('email length cannot exceed more than 30 characters.');
                $("#userEmail").addClass('validation_control');
                return false;
            } else if (!emailReg.test(Email)) {
                alert('please enter the valid email.');
                $("#userEmail").addClass('validation_control');
                return false;
            }
            else {
                $("#userEmail").removeClass('validation_control');
                return true;
            }
        }
        else {
            $("#userEmail").addClass('validation_control');
            alert('must enter emails.');
            return false;
        }

        //End
    }
    function ValidPhone() {
        //phone no. validation
        var phone = $("#userPhone").val();
        if (phone !== '') {
            var phonereg = /^\d{3}-\d{3}-\d{4}$/;
            if (phone.length > 12) {
                $("#userPhone").addClass('validation_control');
                alert('phone no. length cannot exceed more than 12 characters.');
                return false;          
            }
            else {
                $("#userPhone").removeClass('validation_control');
                return true;
            }
        }
        else {
            $("#userPhone").addClass('validation_control');
            alert('must enter phone no.');
            return false;
        }


        //end
    }


    function Validdate() {
        //subject validation
        var subject = $("#datepicker").val();
        if (subject === '') {
            $("#datepicker").addClass('validation_control');
            alert('must enter appointment date.');
            return false;
        }
        else {
            $("#datepicker").removeClass('validation_control');
            return true;
        }
        //end
    }
    function Validmessage() {
        //subject validation
        var subject = $("#message").val();
        if (subject.length > 500) {
            alert(' Body length cannot exceed more than 500 characters.');
            return false;
        }
        else {
            return true;
        }
        //end
    }
</script>
  </asp:Content>
