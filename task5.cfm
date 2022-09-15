<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>User Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">                
    </head>
    <body>
        <cfoutput> 
            <div class="event-schedule-area-two bg-color pad100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title text-center">
                                <div class="title-text">
                                    <h2>Task 5</h2>
                                    <h3>   If we pass 3 (Kollam) to the function, it should return 7,8,9</h3>
                                </div>
                            </div>
                        </div>
                        <!-- /.col end-->
                    </div>
                    <!-- row end-->
                    <div class="row">
                        <div class="col-lg-12">                       
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade active show" id="home" role="tabpanel">
                                    <div class="table-responsive">
                                        <cfset getChildById(3) />
                                        <cffunction name="getChildById" access="public" output="true">
                                            <cfargument name="locationId" type="any"  />
                                            <cfif ARGUMENTS.locationId neq "">	
                                                <cfquery name="qry.rs_getChildById"  result="r">
                                                    SELECT locationId FROM locations WHERE parentLocationId = #ARGUMENTS.locationId#;            
                                                </cfquery>
                                              
                                                <cfset local.childLocId = qry.rs_getChildById.locationId>
                                                <cfset local.colList = "">
                                                <cfif local.childLocId neq "">
                                                    <cfset listAppend(local.colList, qry.rs_getChildById.locationId)>
                                                    <cfset getChildById(qry.rs_getChildById.locationId) /> 
                                                    
                                                </cfif>	
                                                  <cfoutput>GHNGCVN#local.colList#</cfoutput>
                                            </cfif>		                                            	                                           
                                        </cffunction>                                                                                     
                                    </div>
                                </div>
                            </div>                                                 
                        </div>
                        <!-- /col end-->
                    </div>
                    <!-- /row end-->
                </div>
            </div>
        </cfoutput>     
    </body>
</html>