       <!-- Bootstrap Modal -->


            <!--Login, Signup-->
            <div id="signUp-admin-modal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">

                    <!-- login modal content -->
                    <div class="modal-content" id="signUp-admin-contents">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>

                        <div class="modal-body form-style">
                            <h2>Create Your Shopping Account</h2>
                            <form id="SignUp-Form" action="signUpCheck" method="POST">
                                <label>First Name</label>
                                <input type="text" placeholder="Please Enter your First Name" required name="aFName"/>
                                <label>Last Name</label>
                                <input type="text" placeholder="Please Enter your Last Name" required name="aLName"/>
                                <label>Birth-date</label>
                                <input type="date" name="aBDName"/>
                                <label>User Name</label>
                                <input type="text" placeholder="Please Enter your User Name" required name="aUName"/>
                                <label>Password</label>
                                <input type="password" placeholder="Please Enter your Password" required name="aPassword"/>    
                                <label>Job Title</label>
                                <input type="text" placeholder="Please Enter your Job Title" required name="aJName"/>
                                <label>Email Address</label>
                                <input type="email" placeholder="Please Enter your Email Address" required name="aEAName"/>
                                <label>Address</label>
                                <input type="text" placeholder="Please Enter your Address" required name="aAName"/>
                                <label>Interests</label>
                                <input type="text" placeholder="Please Enter your Interests" required name="aANTName"/>
                                <input type="hidden" value="false" name="isAdmin"/>
                                <input type="submit" value="Signup" name="submit"/>
                                <label>
                                        <%
                                        if (request.getParameter("invalid") != null && request.getParameter("invalid").equals("true"))
                                        {
                                        %>

                                        <h1 style="color: red">Invalid user Name Or Password</h1>

                                        <%
                                            }
                                        %>
                                </label>
                            </form>
                        </div>



                    </div>
                    <!-- login modal content -->

                </div>
            </div>


            <!-- Bootstrap Modal -->