<#
	This file is part of Mizumiya.

	Mizumiya is free software: you can redistribute it and/or modify it under the
	terms of the GNU General Public License as published by the Free Software
	Foundation, either version 3 of the License, or (at your option) any later
	version.

	Mizumiya is distributed in the hope that it will be useful, but WITHOUT ANY
	WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
	FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
	details.

	You should have received a copy of the GNU General Public License along with
	Mizumiya. If not, see <https://www.gnu.org/licenses/>.
#>

function _log {
	param(
		[Parameter(ValueFromPipeline)]
		$Message,
		[ValidateSet('', 'Information', 'Warning', 'Fatal')]
		$Type
	)
	
	switch ($Type) {
		{$_ -eq '' -or $_ -eq 'Information'} {
			$Style = ''
			$Type = 'Information'
		}
		
		'Warning' {
			$Style = $PSStyle.Formatting.Warning
		}
		
		'Fatal' {
			$Style = $PSStyle.Formatting.Error
		}
	}
	
	# this log style may or may not be inspired by Minecraft
	Write-Host "$Style[$(get-date -Format 'yyyy-MM-dd HH:mm:ss')] [Mizumiya/$Type] $Message$($PSStyle.Reset)"
	if ($Type -eq 'Fatal') { throw $Message }
}

function _info {
	param(
		[Parameter(ValueFromPipeline)]
		$Message
	)

	_log -Type Information -Message $Message
}

function _warn {
	param(
		[Parameter(ValueFromPipeline)]
		$Message
	)

	_log -Type Warning -Message $Message
}

function _fatal {
	param (
		[Parameter(ValueFromPipeline)]
		$Message
	)
	
	_log -Type Fatal $Message
}
