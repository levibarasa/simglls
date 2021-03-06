
<%@page import="com.orig.gls.utils.App"%>
<%
    String function = (String) session.getAttribute("gfunction");
    String uname = (String) session.getAttribute("uname");
    String solId = (String) session.getAttribute("solId");
    boolean isadded = App.isAdd(function);
    boolean isverify = App.isVerify(function);
    boolean isModify = App.isModify(function);
    boolean isDelete = App.isDelete(function);
    boolean isCancel = App.isCancel(function);
    boolean isInquire = App.isInquire(function);
    String ishidden = "";
    String isreadonly = "";
    String ishiddenv = "";
    String ishiddenib = "";
    String isaddhidden = "";
    String isreadonlym = "readonly='true'";
    String isreadonlymcode = "";
    if (isadded) {
        isreadonlym = "";
        ishidden = "hidden='true'";
    }
    if (isverify || isDelete || isCancel || isInquire) {
        ishiddenv = "hidden='true'";
        isaddhidden = "hidden='true'";
    }
    if (isInquire) {
        ishiddenib = "hidden='true'";
        isaddhidden = "hidden='true'";
    }
    if (isModify) {
        isreadonlym = "";
        isreadonlymcode = "readonly='true'";
        isaddhidden = "hidden='true'";
    }

%>

<html>
    <head>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        <link rel="icon" href="images/favicon.ico" type="image/x-icon" />	
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <script language="javaScript" type="text/javascript" src="include/sim.js"></script>
        <script language="javaScript" type="text/javascript" src="include/jquery-1.11.3.min.js"></script>
        <script language="javaScript" type="text/javascript" src="include/jquery-ui.min.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="include/jsDatePick_ltr.min.css">
        <script type="text/javascript" src="include/jsDatePick.min.1.3.js"></script>
        <script type="text/javascript" src="include/jquery.timepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="include/jquery.timepicker.css" />
        <script type="text/javascript" src="include/lib/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="include/lib/bootstrap-datepicker.css" />
        <script type="text/javascript" src="include/lib/site.js"></script>
        <link rel="stylesheet" type="text/css" href="include/lib/site.css" />
        <script type="text/javascript">
            function MM_findObj(n, d) { //v4.01
                var p, i, x;
                if (!d)
                    d = document;
                if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                    d = parent.frames[n.substring(p + 1)].document;
                    n = n.substring(0, p);
                }
                if (!(x = d[n]) && d.all)
                    x = d.all[n];
                for (i = 0; !x && i < d.forms.length; i++)
                    x = d.forms[i][n];
                for (i = 0; !x && d.layers && i < d.layers.length; i++)
                    x = MM_findObj(n, d.layers[i].document);
                if (!x && d.getElementById)
                    x = d.getElementById(n);
                return x;
            }

            function MM_validateForm() { //v4.0
                var i, p, q, nm, test, num, min, max, errors = '', args = MM_validateForm.arguments;
                for (i = 0; i < (args.length - 2); i += 3) {
                    test = args[i + 2];
                    val = MM_findObj(args[i]);
                    if (val) {
                        nm = val.name;
                        if ((val = val.value) != "") {
                            if (test.indexOf('isEmail') != -1) {
                                p = val.indexOf('@');
                                if (p < 1 || p == (val.length - 1))
                                    errors += '- ' + nm + ' must contain an e-mail address.\n';
                            } else if (test != 'R') {
                                num = parseFloat(val);
                                if (isNaN(val))
                                    errors += '- ' + nm + ' must contain a number.\n';
                                if (test.indexOf('inRange') != -1) {
                                    p = test.indexOf(':');
                                    min = test.substring(8, p);
                                    max = test.substring(p + 1);
                                    if (num < min || max < num)
                                        errors += '- ' + nm + ' must contain a number between ' + min + ' and ' + max + '.\n';
                                }
                            }
                        } else if (test.charAt(0) === 'R')
                            errors += '- ' + nm + ' is required.\n';
                    }
                }
                if (errors)
                    alert('The following error(s) occurred:\n' + errors);
                document.MM_returnValue = (errors === '');
            }

        </script>
        <style type="text/css">
            .div{
                width: 90%;
                height:600px;
                overflow-y:scroll;  
                margin-left:5em;
                overflow-x:scroll;
                padding-bottom:1px;
            }
        </style>
        <script type="text/javascript">
            window.onload = function () {
                $('#meetingtime').timepicker({'scrollDefault': 'now'});
            };
        </script>
        <script type="text/javascript">
            var popup;
            function getSolValueValue() {
                popup = window.open("pop/solpop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getGroupCodeValue() {
                var func = document.getElementById("function");
                if (func.value === "VERIFY") {
                    popup = window.open("pop/grouppop_ver.jsp", "Functions", "width=500,height=400");
                } else if (func.value === "MODIFY" || func.value === "DELETE") {
                    popup = window.open("pop/grouppop_mod.jsp", "Functions", "width=500,height=400");
                } else if (func.value === "CANCEL") {
                    popup = window.open("pop/grouppop_verall.jsp", "Functions", "width=500,height=400");
                } else if (func.value === "INQUIRE") {
                    popup = window.open("pop/grouppop_all.jsp", "Functions", "width=500,height=400");
                }
                popup.focus();
                return false;
            }

            function getUsers() {
                popup = window.open("pop/userspop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getRegionValue() {
                popup = window.open("pop/regionpop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getCenterValue() {
                popup = window.open("pop/centerpop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getVillageValue() {
                popup = window.open("pop/villagepop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getStatusValue() {
                popup = window.open("pop/statuspop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getStatusReasonValue() {
                popup = window.open("pop/statusreasonpop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getFrequencyValue() {
                popup = window.open("pop/frequencypop.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
            function getGroupType() {
                popup = window.open("pop/groupCat.jsp", "Functions", "width=500,height=400");
                popup.focus();
                return false;
            }
        </script>
        <script type="text/javascript">
            if (${gexists == 'true'}) {
                alert("ERROR\nGroup Already Exists!");
            }
            if (${fatal == 'true'}) {
                alert("ERROR\nA Fatal Error Has Occured\nPlease Contact System Administrator!");
            }
        </script>
        <script type="text/javascript">
            window.onload = function () {
                new JsDatePick({
                    useMode: 2,
                    target: "firstmeetingdate",
                    dateFormat: "%d-%M-%Y"
                });
                new JsDatePick({
                    useMode: 2,
                    target: "nextmeetingdate",
                    dateFormat: "%d-%M-%Y"
                });
                new JsDatePick({
                    useMode: 2,
                    target: "formationdate",
                    dateFormat: "%d-%M-%Y"
                });
            };
        </script>
    </head>
    <body>
        <h2 style="font: bold 90% 'Trebuchet MS', 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Tahoma, sans-serif;font-size: 16px">Group Maintenance</h2>
        <form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=domgroup" onsubmit=" return validatePasswords(this)">
            <div class="div">
                <table width="100%" border="0" align="left" cellpadding="5" cellspacing="1">
                    <tr>
                        <th colspan="12" align="left" scope="col"><div class="header">&nbsp;Group Register Maintenance</div></th>
                    </tr>
                    <input type="hidden" name="function" id="function" value="${gfunction}" />
                    <tr <%=isaddhidden%>>
                        <td>Group Type</td>
                        <td>:</td>
                        <td><input type="text" readonly="true" onkeyup="this.value = this.value.toUpperCase();" name="grouptype" id="grouptype" /></td>
                        <td><a href="" onclick="return getGroupType()"><img src="images/search.png"></a></td>
                        <td>Group Name</td>
                        <td>:</td>
                        <td><input type="text" name="groupname1" id="groupname1" onkeyup="this.value = this.value.toUpperCase();" <%=isreadonly%>  /></td>
                    </tr>
                    <tr <%=ishidden%>>
                        <td <%=ishidden%>>Group Code</td>
                        <td  <%=ishidden%>>:</td>
                        <td  <%=ishidden%>><input type="text" <%=isreadonly%> <%=isreadonlymcode%> onkeyup="this.value = this.value.toUpperCase();" name="groupcode" id="groupcode" /></td>
                        <td><a href="" <%=ishidden%> onclick="return getGroupCodeValue()"><img src="images/search.png"></a></td>
                        <td>  Group Name</td>
                        <td>:</td>
                        <td><input type="text" name="groupname" id="groupname" onkeyup="this.value = this.value.toUpperCase();" <%=isreadonly%>  <%=ishidden%> /></td>
                    </tr>
                    <tr>
                        <td>Sol Id</td>
                        <td>:</td>
                        <td><input type="text" name="solid" id="solid" onkeyup="this.value = this.value.toUpperCase();" value="<%=solId%>" readonly="true" /></td>
                        <td ><input type="text" <%=ishidden%> name="branchname" id="branchname" onkeyup="this.value = this.value.toUpperCase();" readonly="true" </td>
                        <td>Group Mgr Id</td>
                        <td>:</td>
                        <td><input type="text" name="acctmgr" onkeyup="this.value = this.value.toUpperCase();" id="acctmgr" readonly="true" value="<%=uname%>"/></td>
                        <td><a href=""  <%=ishiddenv%> onclick="return getUsers()"><img src="images/search.png"></a></td>
                    </tr>        
                    <tr>
                        <td>Group Formation Date</td>
                        <td>:</td>
                        <td><input type="text" name="formationdate" readonly="true" onkeyup="this.value = this.value.toUpperCase();"  id="formationdate"  <%=isreadonly%> /></td>
                        <td></td>
                        <td>Reg. Number</td>
                        <td>:</td>
                        <td><input type="text" name="regnumber" onkeyup="this.value = this.value.toUpperCase();" id="regnumber" <%=isreadonly%> /></td>
                    </tr>
                    <tr>
                        <td>Group Region</td>
                        <td>:</td>
                        <td><input type="text" name="region" id="region" onkeyup="this.value = this.value.toUpperCase();" readonly="readonly" /></td>
                        <td><a href=""  <%=ishiddenv%> onclick="return getRegionValue()"><img src="images/search.png"></a></td>
                        <td>Meeting Frequency</td>
                        <td>:</td>
                        <td><input type="text" name="meetingfrequency" onkeyup="this.value = this.value.toUpperCase();" id="meetingfrequency"/></td>            
                        <td><a href="" <%=ishiddenv%> onclick="return getFrequencyValue()"><img src="images/search.png"></a></td>

                    </tr>
                    <tr>
                        <td>Group District</td>
                        <td>:</td>
                        <td><input type="text" name="groupcenter" onkeyup="this.value = this.value.toUpperCase();" id="groupcenter" readonly="true" /></td>
                        <td><a href=""  <%=ishiddenv%> onclick="return getCenterValue()"><img src="images/search.png"></a></td>
                        <td>Group Village</td>
                        <td>:</td>
                        <td><input type="text" name="groupvillage" onkeyup="this.value = this.value.toUpperCase();" id ="groupvillage" readonly="readonly" /></td>
                        <td><a href=""  <%=ishiddenv%> onclick="return getVillageValue()"><img src="images/search.png"></a></td>
                    </tr>
                    <tr>
                        <td>Group Address</td>
                        <td>:</td>
                        <td><input type="text" name="groupaddress" onkeyup="this.value = this.value.toUpperCase();" id="groupaddress"  <%=isreadonly%> /></td>
                        <td></td>
                        <td>Group Phone</td>
                        <td>:</td>
                        <td><input type="text" <%=isreadonlym%> name="groupphone" maxlength="12" onkeypress="return isNumberKey(event)" id="groupphone" <%=isreadonly%>/></td>            
                    </tr>
                    <tr>
                        <td>First Meeting date</td>
                        <td>:</td>
                        <td><input type="text" name="firstmeetingdate" readonly="true" onkeyup="this.value = this.value.toUpperCase();" id="firstmeetingdate" /></td>
                        <td></td>
                        <td  <%=ishidden%>>Next Meeting date</td>
                        <td  <%=ishidden%>>:</td>
                        <td  <%=ishidden%>><input type="text" name="nextmeetingdate" readonly="true" onkeyup="this.value = this.value.toUpperCase();" id="nextmeetingdate"/></td>            
                    </tr>
                    <tr>
                        <td>Meeting time</td>
                        <td>:</td>
                        <td><input type="text" <%=isreadonlym%> name="meetingtime" onkeyup="this.value = this.value.toUpperCase();" id="meetingtime" class="time"/></td>
                        <td></td>
                        <td>Meeting Place</td>
                        <td>:</td>
                        <td><input type="text" name="meetingplace" onkeyup="this.value = this.value.toUpperCase();" id="meetingplace" readonly="true" /></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td>Max Allowed Members</td>
                        <td>:*</td>
                        <td><input type="text" <%=isreadonlym%> name="maxmembers" onkeyup="this.value = this.value.toUpperCase();" id="maxmembers" value="60"/></td>
                        <td></td>
                        <td>Max Allowed Sub-groups </td>
                        <td>:*</td>
                        <td><input type="text" <%=isreadonlym%> name="maxsgroups" onkeyup="this.value = this.value.toUpperCase();" id="maxsgroups" value="10"/></td>            
                    </tr>
                    <tr>
                        <td>Group Chairperson</td>
                        <td>:</td>
                        <td><input type="text" <%=isreadonlym%> name="chairperson" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Id" id="chairperson" /></td>
                        <td></td>
                        <td colspan="3"><input type="text" <%=isreadonlym%> name="chairpersonname" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Name" id="chairpersonname" size="50"/></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td>Group Treasurer</td>
                        <td>:</td>
                        <td><input type="text" <%=isreadonlym%> name="treasurer" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Id" id="treasurer"/></td>
                        <td></td>
                        <td colspan="3"><input type="text" <%=isreadonlym%> name="treasurername" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Name" id="treasurername"  size="50"/></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td>Group Secretary</td>
                        <td>:</td>
                        <td><input type="text" <%=isreadonlym%> name="secretary" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Id" id="secretary"/></td>
                        <td></td>
                        <td colspan="3"><input type="text" <%=isreadonlym%> name="secretaryname" onkeyup="this.value = this.value.toUpperCase();" placeholder="Customer Name" id="secretaryname" size="50"/></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td>Group Status</td>
                        <td>:</td>
                        <td><input type="text" name="status" onkeyup="this.value = this.value.toUpperCase();" id="status" readonly="true" value="ACTIVE"/></td>
                        <td><a href="" <%=ishiddenv%> <%=isaddhidden%> onclick="return getStatusValue()"><img src="images/search.png"></a></td>
                        <td>Status reason code</td>
                        <td>:</td>
                        <td><input type="text" name="statusreason" onkeyup="this.value = this.value.toUpperCase();" id="statusreason" readonly="true"  value="ACTIVE"/></td>            
                        <td><a href="" <%=ishiddenv%> <%=isaddhidden%> onclick="return getStatusReasonValue()"><img src="images/search.png"></a></td>
                    </tr>
                    <tr>
                        <th colspan="12" align="left" scope="col"><div class="header">&nbsp;Group Financial Details</div></th>
                    </tr>
                    <tr hidden="true">
                        <td>Total Members</td>
                        <td>:</td>
                        <td><input type="text" name="totalmembers" onkeyup="this.value = this.value.toUpperCase();" id="totalmembers" value="0"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Count of Member A/Cs</td>
                        <td>:</td>
                        <td><input type="text" name="totalsavingacs" onkeyup="this.value = this.value.toUpperCase();" value="0" id="totalsavingacs"/></td>
                        <td></td>
                        <td>Total Savings Balance</td>
                        <td>:</td>
                        <td><input type="text" name="totalsavingsbal" onkeyup="this.value = this.value.toUpperCase();" value="0.00" id="totalsavingsbal" /></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td>Count of Member Loan A/Cs</td>
                        <td>:</td>
                        <td><input type="text" name="totalloanacs" onkeyup="this.value = this.value.toUpperCase();" value="0" id="totalloanacs"/></td>
                        <td></td>
                        <td>Total Loans Balance</td>
                        <td>:</td>
                        <td><input type="text" name="totalloanbal" onkeyup="this.value = this.value.toUpperCase();" value="0.00" id="totalloanbal" /></td>            
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="reset" name="Submit2" value="Reset"   class="redButton"/></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><label>
                                <input name="Submit" <%= ishiddenib%> class="redButton" type="submit" onclick="MM_validateForm('solid', '', 'R', 'acctmgr', '', 'R', 'regnumber', '', 'R', 'formationdate', '', 'R', 'region', '', 'R', 'groupcenter', '', 'R',
                                                'groupvillage', '', 'R', 'groupaddress', '', 'R', 'groupphone', '', 'R', 'firstmeetingdate', '', 'R',
                                                'meetingtime', '', 'R', 'meetingplace', '', 'R', 'maxmembers', '', 'R', 'maxsgroups', '', 'R', 'status', '', 'R', 'statusreason', '', 'R', 'chairpersonname', '', 'R', 'treasurername', '', 'R', 'secretaryname', '', 'R',
                                                'meetingfrequency', '', 'R', 'totalsavingacs', '', 'R', 'totalsavingsbal', '', 'R', 'totalloanacs', '', 'R',
                                                'totalloanbal', '', 'R');
                                        return document.MM_returnValue" value="Submit" />
                            </label></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="12"><div class="header">&nbsp;</div></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>