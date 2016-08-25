class cronp {
	file { 'post-hook':
		ensure 	=> file,
		path 	=> '/opt/puppetlabs/puppet/.git/hooks/post-merge',
		source 	=> 'puppet:///modules/cronp/post-merge',
		mode	=> '0755',
		owner 	=> root,
		group 	=> root,
		
	}

	cron { 'puppet-apply':
		ensure 	=> present,
		command => "cd /opt/puppetlabs/puppet ; /usr/bin/git pull",
		user 	=> root,
		minute	=> '*/30',
		require	=> File['post-hook'],
	}
}
