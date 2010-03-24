require 'generators/humpyard'

module Humpyard
  module Generators
    ####
    # == Skeleton Generator
    #
    #   rails humpyard:skeleton [layout_name] [options]
    #
    # === Description
    # The humpyard skeleton generator creates a basic layout, stylesheet and
    # helper which will give some structure to a starting Rails app.
    #
    # === Options
    # <tt>[--skip-compass]</tt>::
    #   Don't generate COMPASS related files (do this only if you really know what you are doing)
    # <tt>[--table-name-prefix=TABLE_NAME_PREFIX]</tt>::
    #  The SQL table name prefix for humpyard as string
    #
    #  Default: <tt>humpyard_</tt>
    # <tt>[--locales=one two three]</tt>::
    #   The locales used in humpyard as array
    #
    #   Default: <tt>en</tt>
    # <tt>[--www-prefix=WWW_PREFIX]</tt>::
    #   The prefix for humpyard www pages as string
    #
    #   Default: <tt>:locale/</tt>
    # <tt>[--skip-haml-init]</tt>::
    #   Don't generate HAML initializer (if you are already using HAML)
    # <tt>[--admin-prefix=ADMIN_PREFIX]</tt>::
    #   The prefix for humpyard admin controllers as string
    #
    #   Default: <tt>admin</tt>
    # <tt>[--skip-compass-init]</tt>::
    #   Don't generate COMPASS initializer (if you are already using COMPASS)
    #
    # === Runtime options
    # <tt>-q, [--quiet]</tt>:: Supress status output
    # <tt>-p, [--pretend]</tt>:: Run but do not make any changes
    # <tt>-s, [--skip]</tt>:: Skip files that already exist
    # <tt>-f, [--force]</tt>:: Overwrite files that already exist
    #
    # === Examples
    #   rails generate humpyard:skeleton
    
    class SkeletonGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'
      
      class_option :www_prefix, :desc => 'The prefix for humpyard www pages as string', :type => :string, :default => ':locale/'
      class_option :admin_prefix, :desc => 'The prefix for humpyard admin controllers as string', :type => :string, :default => 'admin'
      class_option :table_name_prefix, :desc => 'The SQL table name prefix for humpyard as string', :type => :string, :default => 'humpyard_'
      class_option :locales, :desc => 'The locales used in humpyard as array', :type => :array, :default => [:en]
    
      class_option :skip_haml_init, :desc => 'Don\'t generate HAML initializer (if you are already using HAML)', :type => :boolean
      class_option :skip_compass_init, :desc => 'Don\'t generate COMPASS initializer (if you are already using COMPASS)', :type => :boolean
      class_option :skip_compass, :desc => 'Don\'t generate COMPASS related files (do this only if you really know what you are doing)', :type => :boolean
    
      def create_skeleton # :nodoc:
        template 'views/layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
        template 'initializers/humpyard.rb', "config/initializers/humpyard.rb"
        copy_file 'initializers/haml.rb', "config/initializers/haml.rb" unless options[:skip_haml_init]
        unless options[:skip_compass]
          copy_file 'initializers/compass.rb', "config/initializers/compass.rb" unless options[:skip_compass_init]
          copy_file 'compass.config', "config/compass.config" 
          template_path = "#{::File.dirname(__FILE__)}/templates/"
          Dir.glob("#{template_path}stylesheets/**/*.sass").each do |file|
            copy_file file.gsub(template_path, ''), "app/#{file.gsub(template_path, '')}"
          end
          #mk_dir 'public/stylesheets/compiled'
          Dir.glob("#{template_path}images/**/*.{png,gif,jpg}").each do |file|
            copy_file file.gsub(template_path, ''), "public/#{file.gsub(template_path, '')}"
          end
        end  
      end
    
      private
      
      def file_name
        layout_name.underscore
      end
    end
  end
end