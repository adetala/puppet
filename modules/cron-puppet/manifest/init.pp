
class cron-puppet {
	file { 'post-hook':
		ensure 	=> file,
		path 	=> '/opt/puppetlabs/puppet.git/hooks/post-merge',
		source 	=> 'puppet:///modules/cron-puppet/post-merge',
		mode	=> 0755,
		owner 	=> root,
		group 	=> root,
		
	}
	cron { 'puppet-apply':
		ensure 	=> file,
		command => "cd /etc/puppet; /usr/bin/git pull",
		user 	=> root,
		minute	=> '*/30',
		require	=> File['post-hook'],
	}
}
