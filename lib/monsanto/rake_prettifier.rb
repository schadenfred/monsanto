module RakePrettifier

	def inflect(method) 
		method.gsub("make", "making")
	end

	def big_notice(task)
	  puts green("==>") + " " + task.name
	end

	def medium_notice(task)
	  puts green("  -->") + " " + task
	end

	def small_notice(subject)
	  puts green("    ~-") + " Making " + subject
	end
end