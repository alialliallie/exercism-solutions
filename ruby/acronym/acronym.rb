module Acronym
  VERSION = 1

  def self.abbreviate(phrase)
    phrase.split(/\W/)
      .map { |p| acro_part(p) }
      .join.upcase
  end

  private

  def self.acro_part(part)
    caps = part.gsub(/[^A-Z]/, '')
    if caps.empty? || caps == part.upcase
      part[0]
    else
      caps
    end
  end
end
