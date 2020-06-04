append :linked_files, 'config/site_settings/production.yml'

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/site_settings/production.yml ]")
          upload! 'config/site_settings/production.yml', "#{shared_path}/config/site_settings/production.yml"
        end
      end
    end
  end
end
