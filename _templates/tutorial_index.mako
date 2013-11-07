<%inherit file="_templates/site.mako" />
<article class="tutorials_index">
        <%
            count = 1
        %>
        % for name, data in sorted(tutorials_data.iteritems(), key = lambda x: x[1]['date'], reverse = True):
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="well">
                    <h3><a href="${data['filename']}">${name}</a></h3>
                    <p>${data['description']}</p>
                    <span class="date">Written on: ${data['date'].strftime("%d %b %Y")}</span>
                    % if bf.config.blog.disqus.enabled:
                        <br>
                        <!-- This won't work locally but will work on the server. Will keep it local so it you won't jump from local to internet version accidentally, so the number will always be 0 when not running on the server -->
                        <a href="${data['filename']}#disqus_thread">View Comments</a>
                    % endif
                </div>
            </div>
            % if count % 3 == 0:
                <div class="clearfix visible-md visible-lg"></div>
            % endif
            % if count % 2 == 0:
                <div class="clearfix visible-sm"></div>
            % endif
            <%
                count += 1
            %>
        % endfor

</article>
