# Functie 1: Testen of de module succesvol geladen is
function Test-ModuleJVCI {
    Write-Host "De module is succesvol geladen! Voer het commando Set-NameJVCI uit om te beginnen!" -ForegroundColor Green
}

# Functie 2: Vragen naar naam en achternaam
function Set-NameJVCI {
    $global:FullName = Read-Host "Wat is je volledige naam? (Voornaam en Achternaam gescheiden door een spatie)"
    Write-Host "Leuk om kennis te maken $global:FullName! Ik ben PowerShell :)" -ForegroundColor Green
}

# Functie 3: Vragen naar het geboortejaar
function Set-BirthYearJVCI {
    $global:BirthYear = Read-Host "En $global:FullName, in welk jaar ben je geboren?"
    # Validatie: Controleren of het ingevoerde geboortejaar een getal is
    if ($BirthYear -match '^\d{4}$') {
        Write-Host "Aha $global:FullName, jij bent dus geboren in het jaar: $BirthYear" -ForegroundColor Green
    } else {
        Write-Host "Ongeldige invoer. Voer een geldig jaartal in."
        $global:BirthYear = $null
    }
}

# Functie 4: Vragen naar favoriete kleur (met PowerShell-kleurenopties)
function Set-FavoriteColorJVCI {
    $validColors = @("Red", "Green", "Blue", "Yellow", "Magenta", "Cyan", "White", "Black")
    $global:FavoriteColor = Read-Host "Wat is je favoriete kleur? Kies uit: Red, Green, Blue, Yellow, Magenta, Cyan, White, Black"

    if ($validColors -contains $FavoriteColor) {
        Write-Host "Dus, $global:FullName , jouw favoriete kleur is dus $FavoriteColor! Ik heb je tekst nu aangepast naar jouw favoriete kleur :)" -ForegroundColor $global:FavoriteColor
    } else {
        Write-Host "Ongeldige kleur. Kies een van de volgende kleuren: Red, Green, Blue, Yellow, Magenta, Cyan, White, Black."
        $global:FavoriteColor = $null
    }
}

# Functie 5: Samenvatting van naam, geboortejaar en favoriete kleur
function Write-SummaryJVCI {
    if ($null -eq $global:FullName -or $null -eq $global:BirthYear -or $null -eq $global:FavoriteColor) {
        Write-Host "Er ontbreekt informatie. Zorg ervoor dat je alle vragen hebt beantwoord."
    } else {
        # Gebruik van de opgegeven favoriete kleur voor de tekst
        Write-Host "Jouw naam is: $global:FullName" -ForegroundColor $global:FavoriteColor
        Write-Host "Je bent geboren in: $global:BirthYear" -ForegroundColor $global:FavoriteColor
        $verschilJaren = 2006 - $global:BirthYear
        Write-Host "Je bent hiermee $verschilJaren jaar ouder dan PowerShell" -ForegroundColor $global:FavoriteColor
        Write-Host "Je favoriete kleur is: $global:FavoriteColor" -ForegroundColor $global:FavoriteColor
        Start-Sleep -Seconds 10
        Write-Host "Leuk je te ontmoeten $global:FullName, en hopelijk heb je wat van deze minicursus geleerd!" -ForegroundColor Green
    }
}

Export-ModuleMember -Function 'Test-ModuleJVCI', 'Set-NameJVCI', 'Set-BirthYearJVCI', 'Set-FavoriteColorJVCI', 'Write-SummaryJVCI'
