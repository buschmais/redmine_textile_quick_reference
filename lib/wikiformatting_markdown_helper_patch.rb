module Redmine
  module WikiFormatting
    module Textile
      module Helper

        alias :super_wikitoolbar_for :wikitoolbar_for
        def wikitoolbar_for(field_id, preview_url = preview_text_path)
          selected_users = ['admin']
          user = User.current
          if (user.logged? && selected_users.include?(user.login))
            super_wikitoolbar_for(field_id, preview_url) +
            javascript_tag("textileQuickReference(document.getElementById('#{field_id}'));")
          else
            super_wikitoolbar_for(field_id, preview_url)
          end
        end

        alias :super_heads_for_wiki_formatter :heads_for_wiki_formatter
        def heads_for_wiki_formatter
          super_heads_for_wiki_formatter
          unless @heads_for_wiki_textile_quickreference_included
            content_for :header_tags do
              javascript_include_tag('redmine_textile_quick_reference.js', :plugin => 'redmine_textile_quick_reference') +
              stylesheet_link_tag('redmine_textile_quick_reference.css', plugin: 'redmine_textile_quick_reference')
            end
            @heads_for_wiki_textile_quickreference_included = true
          end
        end
      end
    end
  end
end
