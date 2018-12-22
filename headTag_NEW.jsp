<%@page import="java.security.*,gov.state.nextgen.framework.util.FwConstants,
                        gov.state.nextgen.framework.business.entities.cargo.custom.FwProperty"%>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" >  

    <%-- meta tags to prevent cache --%>
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="cache-control" content="must-revalidate">
<meta http-equiv="expires" content="-1">
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="content-encoding" content="gzip" />
<%! String isSearchPage="false"; %>


<%
	// Many pages have this read only check copy-pasted in them, which is bad practice.
	// This is a variable available to all pages, so the implementation can be changed in one place.
	// *Note: as of November 28, 2012 the boolean "isReadOnly" already exists in some JSP's.
	boolean isReadOnlyMode = false;
	if (request.getAttribute("ENV_MODE") != null
			&& request.getAttribute("ENV_MODE").toString()
					.equalsIgnoreCase("R")) {
		isReadOnlyMode = true;
	} else if (session.getAttribute("ENVMODE") != null
			&& session.getAttribute("ENVMODE").toString()
					.equalsIgnoreCase("R")) {
		isReadOnlyMode = true;
	}

	// BEGIN TEMPORARY DEVELOPMENT CODE
	//using fully qualified java.util.Date instead of import to prevent potential ambiguity with java.sql.Date on some pages
	//String BUILD_VERSION = String.valueOf(new java.util.Date().getTime());
	// END TEMPORARY DEVELOPMENT CODE

	// BEGIN PRODUCTION CODE
	 String propFilename = "build";
	  String BUILD_VERSION = FwProperty.getInstance().getProperty(propFilename,"BUILDNUMBER");
	BUILD_VERSION += ".1";
	// END PRODUCTION CODE

	String bridgesBuildStream = null;
	try {
		//bridgesBuildStream = gov.state.nextgen.framework.business.entities.cargo.custom.FwProperty.getInstance().getProperty(gov.state.nextgen.framework.util.FwConstants.BUILD_FILE, "BUILDSTREAM"); 
		bridgesBuildStream = java.lang.System
				.getProperty(FwConstants.FW_ENV_PROP);
		if ((bridgesBuildStream == null)
				|| ((bridgesBuildStream != null) && (bridgesBuildStream
						.equals("null")))) {
			bridgesBuildStream = "";
		}
	} catch (Exception e) {

		System.err
				.println("Error processing \"bridgesBuildStream\" in headTag_NEW.jsp"
						+ e.getMessage());
	}
%>
<%
    String styleLink="/css/ieStyle.css";
    String topLeft = "/images/topLeft.gif";
    String topRight = "/images/topRight.gif";
    if(isReadOnlyMode){
        styleLink="/css/ieStyleReadOnly.css";
        topLeft = "/images/topLeftReadOnly.gif";
        topRight = "/images/topRightReadOnly.gif";
        bridgesBuildStream=bridgesBuildStream+" Read Only";
    }
    
    String HHSNextGenCSS = (popupPage)? "/HHSNextGen/scripts/HSS_NextGen_FF_Popup.css" : "/HHSNextGen/scripts/HSS_NextGen_FF.css";
%> 
   
<%
	if(request.getAttribute(ViewConstants.PAGE_TITLE)!=null) {
%>
<title>
	ND SPACES - <%=request.getAttribute(ViewConstants.PAGE_TITLE)%>
</title>
<%
	}
	else {
%>
<title>
	ND SPACES
</title>
<%	
	}
%>
			
    <link rel="styleSheet" type="text/css" href="/CMPHNextGen/css/CMPHNextGen.css?version=<%=BUILD_VERSION%>">
    <link rel="styleSheet" type="text/css" href="<%=styleLink%>?version=<%=BUILD_VERSION%>">
    <!-- link rel="styleSheet" type="text/css" href="/css/leftNavTree.css?version=<%=BUILD_VERSION%>"> -->
    <!-- link rel="styleSheet" type="text/css" href="/css/popupDiv.css?version=<%=BUILD_VERSION%>"> -->
    <link rel="stylesheet" type="text/css" href="<%=HHSNextGenCSS%>?version=<%=BUILD_VERSION%>" id="appliedCss">
    <!--<link rel="stylesheet" type="text/css" href="/HHSNextGen/scripts/themes/base/jquery.ui.all.css?version=<%=BUILD_VERSION%>"> -->
    <link rel="stylesheet" type="text/css" href="/HHSNextGen/scripts/themes/base/jquery.ui.ng.merged.css?version=<%=BUILD_VERSION%>">
    <!--link rel="stylesheet" type="text/css" href="/css/tables.css?version=<%=BUILD_VERSION%>"> -->
    <!--link rel="stylesheet" type="text/css" href="/HHSNextGen/scripts/css-buttons.css?version=<%=BUILD_VERSION%>"> -->
    
    <!-- the request for jquery/1 will load the latest jQuery in the form of 1.x.x  More Info: http://www.petefreitag.com/item/777.cfm -->
    <!-- <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>  -->
    
    <script type="text/javascript" src="/HHSNextGen/scripts/jquery-1.7.2.min.js"></script> 
   
    
    
    <script type="text/javascript" src="/HHSNextGen/scripts/jquery-ui-1.8.20.custom.min.js?version=<%=BUILD_VERSION%>"></script>
    <%--  uncomment this for jQuery performance suggestions logged to the browser console
       -  script type="text/javascript" src="/HHSNextGen/scripts/jquery.lint.js?version=<%=BUILD_VERSION%>"></script 
       --%>
    <script type="text/javascript" src="/js/common/globalValidator.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/globalErrors.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/glErrorCodes.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/inGlobalErrorsND.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/HHSNextGen/scripts/calendarDateInput.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/HHSNextGen/scripts/HSS_NextGen_Custom_Scripts.js?version=<%=BUILD_VERSION%>"></script>
    
    <script type="text/javascript" src="/js/common/calendar.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/print.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/leftNavTree.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript" src="/js/common/popupDiv.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/JavaScript" src="/HHSNextGen/scripts/jsDraw2DX.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/JavaScript" src="/HHSNextGen/scripts/jsDraw2D.js?version=<%=BUILD_VERSION%>"></script>
    
    

    <link type="text/css" rel="stylesheet" href="/CMPHNextGen/css/visualize.jQuery.css?version=<%=BUILD_VERSION%>">
    <script type="text/javascript" src="/CMPHNextGen/css/enhance.js?version=<%=BUILD_VERSION%>"></script>
    <script type="text/javascript">
    	var appliedCSS = document.getElementById("appliedCss");
    	var userAgent = navigator.userAgent.toLowerCase(),
        browser   = '',
        version   = 0;
       	$.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
        if($.browser.msie){
               appliedCSS.href=appliedCSS.href.replace("FF","IE");
        }
        else if($.browser.chrome){
        	appliedCSS.href=appliedCSS.href.replace("FF","CH");
        	$.browser.safari = false;
        }
        else if($.browser.safari){
        	appliedCSS.href=appliedCSS.href.replace("FF","SA");
    	}
        var isEditMo= true;
    </script>
    <%-- script type="text/javascript" src="/CMPHNextGen/css/visualize.jQuery.js"></script --%>
    
    <!-- Session Warning Start -->
    <%   
      request.setAttribute("pageHeader","");
       String warnMin = "";
       String kickOutMin = "";
       if(FwProperty.getInstance().getProperty(FwConstants.APPLICATION_PROPERTY_FILE, "WARN_MIN")!=null)
            warnMin = FwProperty.getInstance().getProperty(FwConstants.APPLICATION_PROPERTY_FILE, "WARN_MIN");
       if(FwProperty.getInstance().getProperty(FwConstants.APPLICATION_PROPERTY_FILE, "KICK_OUT_MIN")!=null)
            kickOutMin = FwProperty.getInstance().getProperty(FwConstants.APPLICATION_PROPERTY_FILE, "KICK_OUT_MIN");
       %>
       <script type="text/javascript">
       console.log(new Date());
       </script>
       <%
       if(!warnMin.equalsIgnoreCase("")){
    	   out.println("<script type=\"text/javascript\">var warnMin = "+ warnMin +"; var sessionKickOutMin = 1; </script>");
    	   %>
    	    <script type="text/javascript">
    	    var warnMin = <%=warnMin%>;
    	    console.log("WARN_TIME -- FROM Properties file.." + warnMin);
    	    <% if(!kickOutMin.equalsIgnoreCase("")){ %>
    	    	var  sessionKickOutMin = <%=kickOutMin%>;
    	    <%}%>
    	    </script>
           
       <%} 
       else     {
    	   %>
    	   <script type="text/javascript">
    	   console.log("WARN_TIME -- FROM headTag_new.jsp.. 2.5");
	    	</script>
	    	<% 
            out.println("<script type=\"text/javascript\">var warnMin = 14.5 ; var sessionKickOutMin = 1; </script>");
       }
    		%>
    
     <script type="text/javascript" src="/js/common/sessionWarn.js?version=<%=BUILD_VERSION%>"></script> 
       
    <!-- Session Warning End -->
    
    
    <script type="text/javascript">
    resetJSFiles('<%=BUILD_VERSION%>');
    
        var disableRightClick = true; //false;
        fw_x = 600; //default
        fw_y = 400; // default
        var xMax = screen.width, yMax = screen.height;
        var xOffset = xMax - fw_x + "px", yOffset = yMax - fw_y +"px";
        var counter=1;
        var e = null;
        var clickmessage="This feature has been disabled in SPACES for all links and images";
        
        //function disableclick(e) //Disables Mouse Right click on HREF/IMG tags
        function disableclick(evt) {
            if(evt.button == 2){
                var clickmessage = "This functionality is disabled for ths website.";
                evt.stopPropagation();
                alert(clickmessage);
                return false;
            }
        }
        
        var historyLength = null;
        if (history.length > 0) {
            history.go(+1);
            historyLength = history.length;
        }
    
        //history.forward();
    
        /*
        invoked by body tag's onload(). You have to add this to the onload().
        */
        function loadme(){
            //Disable right mouse click Script
            if(disableRightClick){
                document.contextmenu = function(){return false;};
                $('img,a').mousedown( function(event){disableclick(event);} );
            }
        }
    
        // Stop F5 from refreshing the page.
        //$(document).keydown( function (event){});
        
        function openHelpModal(url,title,props){  
             if (counter>4){
                    return;
                 }
                 props = props = props+";scroll:no;center=no;help:no;status=no;minimize:yes;maximize:yes";
                 if(counter ==1){
                    props = props+";dialogLeft:0px;dialogTop:0px";
                 }else if(counter ==2){
                    props = props+";dialogLeft:0px;dialogTop:775px";            
                 }else if(counter ==3){
                    props = props+";dialogLeft:800px;dialogTop:775px";          
                 }else if(counter ==4){
                    props = props+";dialogLeft:800px;dialogTop:0px";
                 }
                 modalValue = showModelessDialog(url,window,props);
                 counter=counter+1;
                 return modalValue; 
            }

        function openModelessWindow(url,title,props){  
            return top.openHelpModal(url,title,props);
        }


        function openWebHelp(url,title,prop) {
          openPopupWindow(url,title,prop);
        }
        /*
        var popUp="";
        if (window.opener && window.opener !== window) {
        	  popUp=true;
        	}
        
        $(window).on('mouseover', (function () {
            window.onbeforeunload = null;
        }));
        $(window).on('mouseout', (function () {
        	if(!popUp){
            window.onbeforeunload = ConfirmLeave;
        	}
        }));
        
        function ConfirmLeave() {
        	setLogout();
        }
        
        var prevKey="";
        $(document).keydown(function (e) { 
      
          if (e.keyCode == 116 || prevKey == 116) {
          	setLogout();
          }
          else if (e.keyCode == 87 && (ctrlKey)) { 
              window.onbeforeunload = ConfirmLeave;
          }
          else if (e.keyCode == 82 && (ctrlKey)) {
          	setLogout();
          }
          else if (( e.keyCode == 115)  && ( altKey)) {
              window.onbeforeunload = ConfirmLeave;
          }else if(( e.keyCode == 115) && ctrlKey){
        	  window.onbeforeunload = ConfirmLeave;
          }
          
            
            prevKey = e.keyCode;
            ctrlKey = e.ctrlKey;
            altKey = e.altKey;
        });
        
      */


    </script>

    <%// this script and IFrame are for calendar popup  to show up . these should be placed
    // before body tag%>
    
    <script type="text/javascript">
       //script tag to stop refreshing page when backspace button is pressed
        $(document).keydown(function(event){
            var evt = event;
           var key_f5 = 116; 
            //var key = (evt.keyCode)? evt.keyCode : evt.which;
            var key = evt.which;
            if(key_f5 == key){
                evt.stopPropagation();
                return false;
            }
            
            var tagName = null;
            var elemArray = new Array("body","table","td","select","a","img","div","caption");
            var typeArray = new Array("radio","checkbox","image");
            var tagType = null;
            
            if(typeof evt.srcElement == "undefined"){
                tagName = evt.target.tagName;
                tagType = evt.target.type;
            }else{
                tagName = evt.srcElement.tagName;
                tagType = evt.srcElement.type;
            }
            if(key == 8 && tagName != null && typeof tagName != "undefined"){
                tagName = tagName.toLowerCase(); 
                if(jQuery.inArray(tagName, elemArray) > -1){
                        evt.returnValue = false;
                        evt.stopPropagation();
                }
                if(tagType!=null && tagType!="undefined"){
                    tagType = tagType.toLowerCase();
                    if(jQuery.inArray(tagType, typeArray) > -1){
                        evt.returnValue = false;
                        evt.stopPropagation();
                    }
                }
            }
        });
    </script>
    
    <script type="text/javascript">
        try{
            resetTimers();
            try{ 
                if(parent){
                    parent.resetTimers();
                }
            }catch(err){
                err.message = "headTag_NEW.jsp - parent.resetTimers() : "+err.message;
                logToBrowserConsole(err);   
            }
            
            try{
                resetAllForParent();
            }catch(err){
                err.message = "headTag_NEW.jsp - resetAllForParent : "+err.message;
                logToBrowserConsole(err);
            }
            var timerRefreshStatusElement = null;
            
            if(parent && parent.document){
                timerRefreshStatusElement = parent.document.getElementById('timerRefreshStatus');   
            }
            if(timerRefreshStatusElement != null && typeof timerRefreshStatusElement != "undefined"){
                timerRefreshStatusElement.value = "true";
            }else{
                if($("#timerRefreshStatus").length){
                    $("#timerRefreshStatus").val("true");
                }
            }
        }catch(err){
            err.message = "headTag_NEW.jsp - resetTimers() : "+err.message;
            logToBrowserConsole(err);
        }
    </script>
    
</head>

<% 
Object isOnlyHCCInCaseObj = request.getAttribute("HCC_ONLY_CASE");
String isOnlyHCCInCase = "";

if(null != isOnlyHCCInCaseObj && isOnlyHCCInCaseObj instanceof String){
	isOnlyHCCInCase = (String)isOnlyHCCInCaseObj;
}

Object enableNonACAPropertyObj = request.getAttribute("NON_ACA_SW");
String enableNonACAProperty = "";

if(null != enableNonACAPropertyObj && enableNonACAPropertyObj instanceof String){
	enableNonACAProperty = (String)enableNonACAPropertyObj;
}
%>

<input type="hidden" name="isOnlyHCCInCaseTag" id="isOnlyHCCInCaseTag" value = "<%=isOnlyHCCInCase%>">
<input type="hidden" name="enableNonACAPropertyTag" id="enableNonACAPropertyTag" value = "<%=enableNonACAProperty%>">

<script type="text/javascript">

function disableTabForParentPageIDHEAD(parentPageID){
	// This method is defined w.r.t similar one in worc.js
   	if(null != document.getElementById(parentPageID)){
   		$("#"+parentPageID).children().children()[1].href='#';
		$("#"+parentPageID+" ul").children().each(function(){
			$(this).children().each(function(){
				var link = $(this)[0];
				link.onClick = false;
		        link.style.cursor = 'default';
		        link.style.color = '#555555';
		    });	
		});
   	}
	
}

$(document).ready(function(){
	// Optimize this when possible so that instead of hardcoded pages below, we fetch the same from a property file
	var isOnlyHCCInCaseTag = $("#isOnlyHCCInCaseTag").val();
	var enableNonACAPropertyTag = $("#enableNonACAPropertyTag").val();
	
	if(null != isOnlyHCCInCaseTag && undefined != isOnlyHCCInCaseTag && "" != isOnlyHCCInCaseTag &&
			null != enableNonACAPropertyTag && undefined != enableNonACAPropertyTag && "" != enableNonACAPropertyTag &&
			isOnlyHCCInCaseTag == "Y" && enableNonACAPropertyTag == "N"){
		
		// DCDAQ Expenses
		disableTabForParentPageIDHEAD('DCDDY');
		disableTabForParentPageIDHEAD('DCDMY');
		disableTabForParentPageIDHEAD('DCDHY');
		disableTabForParentPageIDHEAD('DCAEY');
		
		// DCIQA Incomes
		disableTabForParentPageIDHEAD('DCMYL');
		disableTabForParentPageIDHEAD('DCCIN');
		disableTabForParentPageIDHEAD('DCITL');
		
		// DCRQU Resources/Assets
		disableTabForParentPageIDHEAD('DCRQZ');
		disableTabForParentPageIDHEAD('DCRUX'); 
		disableTabForParentPageIDHEAD('DCRVZ');
		disableTabForParentPageIDHEAD('DCRAZ');
		disableTabForParentPageIDHEAD('DCCRM');
	}
});
</script>

<!-- 
	DISTRIBUTED MAP CACHE <<START>>
-->

  <style>
  .Heading_New_1{
	font-family:Verdana, Geneva, sans-serif;
	font-size:34px;
	line-height:normal;	
	font-weight:100;
	color:#00A1DE;
}
  </style>
<script>


var lockedUser = '';
var readWriteUserShow = '';
var restrictCsSwitch='';
var caseLockedViaBatch='';
<%
String lockedUserId = (String) request.getAttribute("CASE_LOCKED_USER");
String OfficeName = (String) request.getAttribute("OFFICE_NAME_LOGEDIN");
String userFirstName = (String) request.getAttribute("USER_FIRST_LAST_NAME");
String restrictCaseSwitch = (String) request.getAttribute("RESTRICT_CASE_SW");
String readWriteUser = (String) request.getAttribute("readWriteUser");
String caseLockedWithBatch = (String) request.getAttribute("CASE_LOCKED_WITH_BATCH");
String caseActionSelected = (String) request.getAttribute("CaseDescription");

if(lockedUserId != null){%>
	lockedUser = '<%=lockedUserId%>';
<%}%>

<%if(readWriteUser != null){%>
	readWriteUserShow = '<%=readWriteUser%>'; 
<%}%>

<%if(restrictCaseSwitch != null){%>
restrictCsSwitch = '<%=restrictCaseSwitch%>'; 
<%}%>

<%if(caseLockedWithBatch != null){%>
caseLockedViaBatch = '<%=caseLockedWithBatch%>'; 
<%}%>

$(document).ready(function() { 
	
	$( "#dialog-confirm" ).hide();
	$('form[name="form1"]').append("<input type='hidden' name='unlockEntity' value='N'/>"); 
	$('form[name="form1"]').append("<input type='hidden' name='restrictSwitch' value='N'/>"); 
	if(lockedUser != null && lockedUser.trim() != '' && readWriteUserShow != null && readWriteUserShow.trim() != '' && readWriteUserShow == 'readWrite'){
		lockedUser = null;
		readWriteUserShow = null;
		$( function() {
			$( "#dialog-confirm" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: 600,
		      modal: true,
		      open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); },
		      buttons: {
		        "SUBMIT": function() { 
			        if($('#dialog-confirm :radio:checked').val() == "YES"){ 
			        	 $(this ).dialog( "close" );
    	 			     document.form1.unlockEntity.value="Y";
    	 			     if(restrictCsSwitch != null && restrictCsSwitch == 'Y'){ 
			        		 document.form1.restrictSwitch.value = "Y"; 
			        	 }
				         setActionFieldAndSubmit(document.form1,'Next');
			        }else if($('#dialog-confirm :radio:checked').val() == "NO"){
			        	 $(this ).dialog( "close" );
			        	 document.form1.caseAction.value='PE'; 
			        }    
		        },
		        "CANCEL": function() {
		          $( this ).dialog( "close" );
		        } 
		      }
		    });
		  } );
	}
	
	if(lockedUser != null && lockedUser.trim() != '' && readWriteUserShow != null && readWriteUserShow.trim() != '' && readWriteUserShow == 'readOnly'){
		lockedUser = null;
		readWriteUserShow = null;
		$( function() {
			$( "#dialog-confirm" ).dialog({
		      resizable: false, 
		      height: "auto",
		      width: 600,
		      modal: true,
		      open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); },
		      buttons: {
		        "CANCEL": function() {
		          document.form1.caseAction.value='PE'; 
		          $( this ).dialog( "close" );
		        }
		      }
		    });
		  } );
		
	}
	
	if(caseLockedViaBatch != null && caseLockedViaBatch.trim() != '' && (caseLockedViaBatch == 'Y' || caseLockedViaBatch == 'YES')){
		caseLockedViaBatch = null;
		document.getElementById("errorSpanClient").innerHTML = " ";
		$( function() {
			$( "#dialog-confirm" ).dialog({
		      resizable: false,
		      height: "auto",
		      width: 600,
		      modal: true,
		      open: function(event, ui) { jQuery('.ui-dialog-titlebar-close').hide(); },
		      buttons: {
		        "CANCEL": function() {
		          document.form1.caseAction.value='PE'; 
		          $( this ).dialog( "close" );
		        }
		      }
		    });
		  } );
		
	}
});       
</script>
<%

if(lockedUserId != null || caseLockedWithBatch != null){%>

<div id="dialog-confirm" title="ND SPACES">
<h2 class="Heading_New_1">Case Lock</h2>
<hr>
<%if(readWriteUser != null && readWriteUser.equalsIgnoreCase("readWrite")){%>
  		<p>
  		This Case is currently locked by <%=userFirstName%> from <%=OfficeName%>. Please select 'YES' and click submit to take lock 
  		and access the case in <%=caseActionSelected%> mode. Please select 'NO' and click submit to access the case on 'View only data-collection' mode.
  		</p>
   		<p>
  		<input type="radio" name="chooseone" value="YES" id="1"><label for="1"> YES</label><br> 
  		<input type="radio" name="chooseone" value="NO" id="2"><label for="2">NO</label><br>	
  		</p>
	<%}else if(readWriteUser != null && readWriteUser.equalsIgnoreCase("readOnly")){ %>	
	<p>
  		
  		This Case is currently locked by <%=userFirstName%> from <%=OfficeName%>. Please contact helpdesk to access the case in <%=caseActionSelected%> mode. 
  		This case still be accessed in 'View only data-collection' mode.
 	</p>
	
	<%} else if(caseLockedWithBatch != null && (caseLockedWithBatch.equalsIgnoreCase("Y") || caseLockedWithBatch.equalsIgnoreCase("YES"))){%>
	<p>
  		Eligibilty is running for this case in the background. Hence, this case cannot be accessed in <%=caseActionSelected%> mode. 
  		This case can still be accessed in 'View only data-collection' mode. Please contact system support for questions.
 	</p>
	<%}%>
	</div>
	
	<%}%>
<!-- 
	DISTRIBUTED MAP CACHE <<END>>
-->