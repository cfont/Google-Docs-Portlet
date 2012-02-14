<%
/**
 *  Copyright (c) 2011-2012 Educational Service Unit 10.
 *
 *  This file is part of the Google Docs portlet.
 *
 *  Google Docs portlet is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Google Docs portlet is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with the Google Docs portlet.  If not, see <http://www.gnu.org/licenses/>.
 **/
%>

<%@include file="/init.jsp" %>

<div class="doc-list-wrapper" id="<portlet:namespace />docListWrapper">
	<liferay-ui:search-container emptyResultsMessage="there-are-no-google-docs-to-display" delta="20">
    	<liferay-ui:search-container-results>
    	<%
    		List<DocumentListEntry> tempResults = ActionUtil.getDocumentList(feed);

    		results = ListUtil.subList(tempResults, searchContainer.getStart(), searchContainer.getEnd());
		    total = tempResults.size();

		    pageContext.setAttribute("results", results);
		    pageContext.setAttribute("total", total);
	    %>
    	</liferay-ui:search-container-results>

    	<liferay-ui:search-container-row
    		className="com.google.gdata.data.docs.DocumentListEntry"
    		keyProperty="resourceId"
    		modelVar="entry">

    		<liferay-ui:search-container-column-jsp
		        name="doc-type"
		        path="/column_doctype.jsp"
		        />

		    <liferay-ui:search-container-column-text
		        name="doc-title"
		        value="<%=entry.getTitle().getPlainText() %>"
		        href="<%=entry.getDocumentLink().getHref() %>"
		        target="_blank"
		        />

		    <liferay-ui:search-container-column-text
		        name="doc-updated"
		        value="<%=entry.getUpdated().toUiString() %>"
		        />

		    <liferay-ui:search-container-column-jsp
       			path="/column_docactions.jsp"
       			align="right"
        	/>

	      </liferay-ui:search-container-row>

	      <liferay-ui:search-iterator />

	</liferay-ui:search-container>
</div>