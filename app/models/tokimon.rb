class Tokimon < ActiveRecord::Base
	belongs_to :trainer


	def skillPos(skillName, skill)
   		ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM tokimons WHERE #{skillName} < (SELECT #{skillName} FROM tokimons WHERE #{skillName} = #{skill} AND id = #{self.id}) ")
	end

	def skillCount(skillName)
		Tokimon.select("#{skillName}").count - 1
	end

	def getSkillPct(skillName, skill)
		(1 - skillPos(skillName, skill).last()["count"].to_f / skillCount(skillName)) * 100
	end

	def isSkillTop(skillName, skill)
		if skillPos(skillName, skill).last()["count"].to_f / skillCount(skillName) == 1.0
			true
		else
			false
		end
	end

end
