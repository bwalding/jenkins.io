
# This extension expects that some files are in the _tmp directory so it can
# add their content to the site object

class Releases
  def execute(site)
    tmp_dir = File.expand_path(File.dirname(__FILE__) + '/../_tmp')

    # Something is messed up if our temporary directory doesn't exist
    unless File.exists? tmp_dir
      return
    end

    latest = File.join(tmp_dir, 'latestCore.txt')
    stable = File.join(tmp_dir, 'latestLTSCore.txt')

    # Add a jenkins property if it doesn't already exist
    unless site.jenkins
      site.jenkins = {}
    end

    if File.exists? latest
      site.jenkins.latest = File.read(latest).chomp
    end

    if File.exists? stable
      site.jenkins.stable = File.read(stable).chomp
    end
  end
end
