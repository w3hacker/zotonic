{# Show an object with an unlink option. Used in the admin_edit #}
{% with m.rsc[object_id].title as title %}
{% sortable id=#unlink_wrapper tag=edge_id %}
<li id="{{ #unlink_wrapper }}" class="menu-item">
    <div>
	    <i class="z-icon z-icon-drag"></i>
        <a id="{{ #edit }}" href="{% url admin_edit_rsc id=object_id %}" title="{_ Edit _}">
	    	{% image object_id mediaclass="admin-list-dashboard" %}
        	{{ title|truncate:30|default:"<i>untitled</i>" }}
            <span class="category">{{ object_id.category_id.title|truncate:20 }}</span>
       	</a>
        <button id="{{ #unlink }}" title="{_ Disconnect _}" class="z-btn-remove"></button>
    </div>
</li>
{% endwith %}

{% wire id=#unlink action={unlink subject_id=subject_id edge_id=edge_id hide=#unlink_wrapper} %}
{% wire id=#edit target=#unlink_wrapper action={dialog_edit_basics edge_id=edge_id} %}
